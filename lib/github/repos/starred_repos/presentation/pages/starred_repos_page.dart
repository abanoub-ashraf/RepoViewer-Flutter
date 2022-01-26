import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../auth/shared/providers.dart';
import '../../../../core/shared/providers.dart';
import '../components/paginated_repos_list_view.dart';

class StarredReposPage extends StatefulWidget {
    const StarredReposPage({ Key? key }) : super(key: key);

    @override
    State<StarredReposPage> createState() => _StarredReposPageState();
}

class _StarredReposPageState extends State<StarredReposPage> {
    @override
    void initState() {
        super.initState();

        ///
        /// we have to wait until the context gets fully initialized then call its read()
        /// function so we can use this approach for that
        ///
        Future.microtask(
            ///
            /// - read() reads the provider without listening to it
            /// 
            /// - this way is for accessing the functions of the notifier provider
            ///
            () => context
                .read(starredReposNotifierProvider.notifier)
                ///
                /// when this function is called, the repos we got will be
                /// automatically available inside the paginated repos list view file
                /// cause riverpod is not limited to a specific widget 
                ///
                .getNextStarredReposPage()
        );

        ///
        /// others might use this approach for doing the same thing above
        ///
        // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        //     context
        //         .read(starredReposNotifierProvider.notifier)
        //         .getNextStarredReposPage();
        // });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Starred Repositories'),
                actions: [
                    IconButton(
                        icon: const Icon(MdiIcons.logoutVariant),
                        onPressed: () {
                            context
                                .read(authNotifierProvider.notifier)
                                .signOut();
                        },
                    )
                ],
            ),
            body: const PaginatedReposListView(),
        );
    }
}