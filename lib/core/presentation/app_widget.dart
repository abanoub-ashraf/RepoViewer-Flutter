import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';
import 'package:repo_viewer/utils/app_constants.dart';

///
/// - A provider that asynchronously creates a single value.
/// 
/// - FutureProvider can be considered as a combination of Provider and FutureBuilder. 
///   By using FutureProvider, the UI will be able to read the state of the future synchronously, 
///   handle the loading/error states, and rebuild when the future completes.
///
final initializationProvider = FutureProvider<Unit>((ref) async {
    ///
    /// - this initialization provider will be used for checking if the user signed in or not
    ///   and we want this provider to only run once that's why we used read() instead of watch()
    /// 
    /// - .notifier to read the actual notifier of the provider
    ///
    final authNotifier = ref.read(authNotifierProvider.notifier);
    
    await authNotifier.checkAndUpdateAuthStatus();

    return unit;
});

class AppWidget extends StatelessWidget {
    ///
    /// this is the router class that got generated by the auto route package
    ///
    final appRouter = AppRouter();

    @override
    Widget build(BuildContext context) {
        ///
        /// to define the routes in the app using the auto route package:
        /// use the .router() and give it the router delegate and the router information parser
        /// using the app routes class that is generated by the package not the class we created
        ///
        return ProviderListener(
            ///
            /// - ProviderListener is used for listening fo the the initializationProvider
            /// 
            /// - the only reason we're listening to the provider above is so it runs
            ///   we don't wanna do anything else with it
            ///
            provider: initializationProvider,
            onChange: (context, value) {},
            child: ProviderListener<AuthState>(
                ///
                /// this provider listener will listen to the auth notifier provider
                /// to check do something based on each state we got from the AuthState
                ///
                provider: authNotifierProvider,
                onChange: (context, state) {
                    state.maybeMap(
                        orElse: () {},
                        authenticated: (_) {
                            appRouter.pushAndPopUntil(
                                const StarredReposRoute(), 
                                predicate: (route) => false
                            );
                        },
                        unauthenticated: (_) {
                            appRouter.pushAndPopUntil(
                                const SignInRoute(), 
                                predicate: (route) => false
                            );
                        }
                    );
                },
                child: MaterialApp.router(
                    title: AppConstants.appName,
                    routerDelegate: appRouter.delegate(),
                    routeInformationParser: appRouter.defaultRouteParser(),
                ),
            ),
        );
    }
}