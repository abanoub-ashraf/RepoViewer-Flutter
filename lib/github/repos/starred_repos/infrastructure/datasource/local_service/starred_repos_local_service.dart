import 'package:collection/collection.dart';
import 'package:sembast/sembast.dart';

import '../../../../../../core/infrastructure/datasource/local_service/sembast_database.dart';
import '../../../../../core/infrastructure/config/pagination_config.dart';
import '../../../../../core/infrastructure/dtos/github_repo/github_repo_dto.dart';

///
/// 
///
class StarredReposLocalService {
    final SembastDatabase _sembastDatabase;

    ///
    /// - this int factory is because the data we wanna save has a key of type int
    ///   not string like what we did with the github headers cache
    /// 
    /// - we use int as key cause the data we wanna store here will be
    ///   an int value which is the page number and the data of that page
    ///
    final _store = intMapStoreFactory.store('starredRepos');

    StarredReposLocalService(
        this._sembastDatabase
    );

    ///
    /// - upsert means update or insert
    /// 
    /// - if there'e already a page stored then we will just update it with new data
    ///   however if there's not then insert that page 
    ///
    Future<void> upsertPage(List<GithubRepoDTO> dtos, int page) async {
        ///
        /// go from github numbering system which starts from 1
        /// into the regular numbering system which starts from 0
        ///
        final sembastPage = page - 1;

        ///
        /// assume we have 3 pages and each page has 3 items so we need to have 
        /// these places [0, 1, 2, 3, 4, 5, 6, 7, 8] in the records()
        /// 
        /// 1- sembastPage is 1-1=0 * 3 = 0 + each index (index is always gonna be 0,1,2) = [0,1,2]
        /// 2- sembastPage is 2-1=1 * 3 = 3 + each index (index is always gonna be 0,1,2) = [3,4,5]
        /// 3- sembastPage is 3-1=2 * 3 = 6 + each index (index is always gonna be 0,1,2) = [6,7,8]
        /// 
        /// now [0,1,2] and [3,4,5] and [6,7,8] are the places we wanna save in the records()
        /// as keys for the values that we wanna save which are the list of the repo dto 
        /// but in the  json format
        ///
        await _store
            .records(
                dtos.mapIndexed(
                    (index, _) => index + PaginationConfig.itemsPerPage * sembastPage
                )
            )
            .put(
                _sembastDatabase.instance, 
                dtos
                    .map((githubRepoDtoElement) => githubRepoDtoElement.toJson())
                    .toList(),
            );
    }

    Future<List<GithubRepoDTO>> getPage(int page) async {
        ///
        /// go from github numbering system which starts from 1
        /// into the regular numbering system which starts from 0
        ///
        final sembastPage = page - 1;

        final records = await _store.find(
            _sembastDatabase.instance, 
            finder: Finder(
                ///
                /// say we have these number of records in the database
                /// 0, 1, 2 || 3, 4, 5 || 6, 7, 8
                /// limit: 3 means we wanna get 3 records per single fetch
                ///
                limit: PaginationConfig.itemsPerPage,
                ///
                /// offset means we wanna fetch the first 3 records then the next three
                /// and so on so that could happen by saying 3 * the current page index
                ///
                offset: PaginationConfig.itemsPerPage * sembastPage,
            ),
        );

        return records
            .map((record) => GithubRepoDTO.fromJson(record.value))
            .toList();
    }

    ///
    /// - get the number of pages in the local storage
    /// 
    /// - every page has many repos we just need the count of those pages 
    ///
    Future<int> getLocalPageCount() async {
        final reposCount = await _store.count(_sembastDatabase.instance);
        ///
        /// - the number of all the records / the number of the pages that holds them 
        ///   to get how many pages we have
        /// 
        /// - .ceil() in case we got a number like 0.4 or 0.7 we want only full number
        ///
        return (reposCount / PaginationConfig.itemsPerPage).ceil();
    }
}