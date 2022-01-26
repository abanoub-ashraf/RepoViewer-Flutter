import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/domain/entities/fresh_data_entity.dart';
import '../../../core/infrastructure/config/pagination_config.dart';
import '../infrastructure/repositories/starred_repos_repository.dart';
import 'starred_repos_state.dart';

///
/// here we will keep track of the page that we will get next
///
class StarredReposNotifier extends StateNotifier<StarredReposState> {
    final StarredReposRepository _starredReposRepository;

    ///
    /// - we will keep track of the currently displayed page here in the application layer
    /// 
    /// - the presentation layer doesn't need to know about this page number
    /// 
    /// - this starts from 1 not 0 cause the github api counting system starts by 1
    ///
    int _page = 1;

    StarredReposNotifier(
        this._starredReposRepository
    ) : super(
        StarredReposState.initial(FreshDataEntity.yes([]))
    );

    ///
    /// we wanna get the starred repos  from the infrastructure and convert it 
    /// into a state then send that state to the ui
    ///
    Future<void> getNextStarredReposPage() async {
        ///
        /// - first thing will be sent to the ui is the loading state
        ///   with previous starred repos if we got previous ones to show
        /// 
        /// - then items per page is for the shimmer animation in the ui
        ///
        state = StarredReposState.loadInProgress(
            state.starredRepos, 
            PaginationConfig.itemsPerPage
        );

        ///
        /// - then we wanna get the starred repos from the infrastructure's repository
        /// 
        /// - we can't increase the page number in this line cause in that case 
        ///   we will keep getting new data for every upcoming page and if one of them failed
        ///   we will get new data for the next and tht failed one will be ignored
        /// 
        /// - we wanna increase the page only when we successfully get data so that 
        ///   if page 2 failed, we don't wanna jump to page 3 and get its data, 
        ///   we wanna stop at page 2 and print error and retry to get that page again
        ///   so we will store the either type response we get from the repository
        ///   to increase the page only in the case of getting successful data
        ///
        final failureOrReposEntity = await _starredReposRepository.getStarredReposPage(_page);

        ///
        /// check what w got from the repository and send state to the ui based on 
        /// the 2 sides we got the left error side, and the right success side
        ///
        state = failureOrReposEntity.fold(
            ///
            /// if we got error, we will return a failure state to the ui with 
            /// the previously loaded repos and the error we got from the repository
            ///
            (l) => StarredReposState.loadFailure(state.starredRepos, l), 
            ///
            /// if we got successful data, we wanna increase the page number to 
            /// be able to get the next page and then return the previously loaded repos
            /// and also concatenate the newly one we got from the right side r 
            ///
            (r) {
                ///
                /// increase the page number only when we get the success data
                ///
                _page++;

                return StarredReposState.loadSuccess(
                    ///
                    /// get the list of repose (the previously loaded one and the new one)
                    ///
                    r.copyWith(
                        entity: [
                            ...state.starredRepos.entity, 
                            ...r.entity
                        ]
                    ), 
                    ///
                    /// - the repository returns a fresh, and also has a page int variable,
                    ///   that fresh comes from each case of the remote that comes from 
                    ///   the data source and a max page int variable comes from it as well,
                    ///   so the value of this isNextPageAvailable bool is the result of comparing
                    ///   the page variable that the repository has with the max page that 
                    ///   comes from the datasource
                    /// 
                    /// - this bool may not always be available in the fresh entity 
                    ///   so its default value is false
                    ///
                    isNextPageAvailable: r.isNextPageAvailable ?? false
                );
            }
        );
    }
}