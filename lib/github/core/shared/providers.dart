import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/shared/providers.dart';
import '../../repos/starred_repos/application/starred_repos_notifier.dart';
import '../../repos/starred_repos/application/starred_repos_state.dart';
import '../../repos/starred_repos/infrastructure/datasource/local_service/starred_repos_local_service.dart';
import '../../repos/starred_repos/infrastructure/datasource/remote_service/starred_repos_remote_service.dart';
import '../../repos/starred_repos/infrastructure/repositories/starred_repos_repository.dart';
import '../infrastructure/datasource/local_service/github_headers_cache.dart';

final githubHeadersCacheProvider = Provider(
    (ref) => GithubHeadersCache(
        ref.watch(sembastDBProvider)
    )
);

final starredReposLocalServiceProvider = Provider(
    (ref) => StarredReposLocalService(
        ref.watch(sembastDBProvider)
    )
);

final starredReposRemoteServiceProvider = Provider(
    (ref) => StarredReposRemoteService(
        ref.watch(dioProvider),
        ref.watch(githubHeadersCacheProvider)
    )
);

final starredReposRepositoryProvider = Provider(
    (ref) => StarredReposRepository(
        ref.watch(starredReposRemoteServiceProvider),
        ref.watch(starredReposLocalServiceProvider)
    )
);

///
/// we gonna use this from the presentation layer and that usage is going 
/// to trigger a chain reaction of the other providers defined above
///
final starredReposNotifierProvider = StateNotifierProvider<StarredReposNotifier, StarredReposState>(
    (ref) => StarredReposNotifier(
        ref.watch(starredReposRepositoryProvider)
    )
);