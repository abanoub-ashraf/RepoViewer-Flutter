import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/domain/failures/github_failure.dart';

import '../../../../core/domain/entities/fresh_data_entity.dart';
import '../../../core/domain/entities/github_repo/github_repo_entity.dart';

part 'starred_repos_state.freezed.dart';

@freezed
class StarredReposState with _$StarredReposState {
    const StarredReposState._();
    const factory StarredReposState.initial(
        ///
        /// we don't need this here but it's good to have the starredRepos felid
        /// in all the cases of the state
        ///
        FreshDataEntity<List<GithubRepoEntity>> starredRepos
    ) = _Initial;
    ///
    /// - when we load the next page this load in progress state will occur but we also 
    ///   wanna still display the previous starred repos that we already got from 
    ///   the load success state to have them on the screen wile the new starred repos appear
    /// 
    /// - this itemsPerPage integer will be used for how many tiles we will show in the shimmer
    ///   inside the presentation layer when this load in progress is passed to the ui
    ///
    const factory StarredReposState.loadInProgress(
        FreshDataEntity<List<GithubRepoEntity>> starredRepos,
        int itemsPerPage
    ) = _LoadInProgress;
    ///
    /// this state will go to the presentation layer with the data that is successfully loaded
    ///
    const factory StarredReposState.loadSuccess(
        FreshDataEntity<List<GithubRepoEntity>> starredRepos,
        ///
        /// when we arrive to the last page in the presentation layer we no longer want
        /// to load the next page so this bool will let the presentation layer know about that
        ///
        { required bool isNextPageAvailable }
    ) = _LoadSuccess;
    ///
    /// - if we loaded first 2 pages then an error happened in the third one we still
    ///   wanna display the first 2 pages we got
    /// 
    /// - the failure is to tell the presentation when things go wrong so the presentation
    ///   handle that by showing custom error message or whatever thing else 
    ///
    const factory StarredReposState.loadFailure(
        FreshDataEntity<List<GithubRepoEntity>> starredRepos,
        GithubFailure failure
    ) = _LoadFailure;
}