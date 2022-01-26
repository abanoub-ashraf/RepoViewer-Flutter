import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/domain/failures/github_failure.dart';
import '../../../../core/shared/providers.dart';

class FailureRepoTile extends StatelessWidget {
    ///
    /// we will use this failure to populate the text for 
    /// the error that occurred
    ///
    final GithubFailure failure;

    const FailureRepoTile({
        Key? key, 
        required this.failure
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        ///
        /// this widget is for styling its own sub tree
        ///
        return ListTileTheme(
            textColor: Theme.of(context).colorScheme.onError,
            iconColor: Theme.of(context).colorScheme.onError,
            child: Card(
                color: Theme.of(context).errorColor,
                margin: const EdgeInsets.symmetric(
                    horizontal: 16, 
                    vertical: 8,
                ),
                child: ListTile(
                    title: const Text('An Error occurred, please try again'),
                    subtitle: Text(
                        ///
                        /// use the failure content as a text
                        ///
                        failure.map(api: (_) => 'API returned ${_.errorCode}'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                    ),
                    leading: const SizedBox(
                        ///
                        /// in order for the icon to be centered
                        ///
                        height: double.infinity,
                        child: Icon(Icons.warning),
                    ),
                    ///
                    /// it's safe here to call the notifier method again to get the exact same page
                    /// that we failed to get because this method doesn't get the next page if 
                    /// an error came out of it
                    ///
                    trailing: IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                            context
                                .read(starredReposNotifierProvider.notifier)
                                .getNextStarredReposPage();
                        },
                    ),
                ),
            ),
        );
    }
}