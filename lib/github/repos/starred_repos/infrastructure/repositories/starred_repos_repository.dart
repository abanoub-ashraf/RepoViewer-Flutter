import 'package:dartz/dartz.dart';

import '../../../../../core/domain/entities/fresh_data_entity.dart';
import '../../../../../core/infrastructure/networking/rest_api_exception.dart';
import '../../../../core/domain/entities/github_repo/github_repo_entity.dart';
import '../../../../core/domain/failures/github_failure.dart';
import '../../../../core/shared/extensions.dart';
import '../datasource/local_service/starred_repos_local_service.dart';
import '../datasource/remote_service/starred_repos_remote_service.dart';

///
/// - repository will return entity or failure which means the dto that comes
///   from the remote/local services will be converted into entities in the repository
/// 
/// - the dto will be converted into entities and the exceptions will be converted
///   into failures
///
class StarredReposRepository {
    final StarredReposRemoteService _remoteService;
    final StarredReposLocalService _localService;

    StarredReposRepository(
        this._remoteService,
        this._localService
    );

    ///
    /// - this page int will be passed to this function from the application layer
    ///   so inside this repository class we will need to know about the max page number
    ///   and that's will be available to us from the remote response we get from 
    ///   the remote service
    /// 
    /// - we need to know the max page number here cause we will increase the page number
    ///   and stop at that max page number
    /// 
    /// - the max page will be sent across to the application layer
    ///
    Future<Either<GithubFailure, FreshDataEntity<List<GithubRepoEntity>>>> getStarredReposPage(
        int page
    ) async {
        try {
            final remotePageItems = await _remoteService.getStarredReposPage(page);
            
            ///
            /// this right side returns a fresh entity but that fresh will be returned
            /// from the different cases of the remote response we got from the remote service
            ///
            return right(
                ///
                /// - the max page number is coming from the remote service response
                ///   that this line [await _remoteService.getStarredReposPage(page);]
                ///   returns from the remote service
                /// 
                /// - if the page that's coming fom the application layer as a param to this function
                ///   is less than the max page that we got from the remote service then the value
                ///   of the isNextPageAvailable variable is true
                ///
                await remotePageItems.when(
                    ///
                    /// - the maxPage is determined by the remote service in all the other cases
                    ///   but in the no connection one we want it to be determined by the local service
                    /// 
                    /// - in the no connection we can't get the max page from the api cause 
                    ///   we have no internet connection
                    ///
                    noConnection: () async {
                        ///
                        /// - in this no connection case we got the max page from the remote service
                        /// 
                        /// - we will give the local list of github repos entity to 
                        ///   the application layer
                        ///
                        return FreshDataEntity.no(
                            await _localService
                                .getPage(page)
                                .then((githubRepoDtos) => githubRepoDtos.toDomain()), 
                            isNextPageAvailable: page < await _localService.getLocalPageCount(),
                        );
                    },
                    notModified: (maxPage) async {
                        ///
                        /// - in this not modified case we got the max page from the remote service
                        /// 
                        /// - we will give the local list of github repos entity to 
                        ///   the application layer
                        ///
                        return FreshDataEntity.yes(
                            await _localService
                                .getPage(page)
                                .then((githubRepoDtos) => githubRepoDtos.toDomain()),
                            isNextPageAvailable: page < maxPage,
                        );
                    },
                    withNewData: (data, maxPage) async {
                        ///
                        /// save the new data we got from the remote service 
                        /// inside the local one
                        ///
                        await _localService.upsertPage(data, page);

                        ///
                        /// give the list of github repo entities to the application layer
                        ///
                        return FreshDataEntity.yes(
                            data.toDomain(), 
                            isNextPageAvailable: page < maxPage
                        );
                    }
                ),
            );
        } on RestApiException catch (exception) {
            return left(
                GithubFailure.api(exception.errorCode)
            );
        }
    }
}