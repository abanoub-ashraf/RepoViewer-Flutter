import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';

///
/// this [presentation layer] will use the functions of the [application layer]
///
class SignInPage extends ConsumerWidget {
    const SignInPage({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context, ScopedReader watch) {
        return Scaffold(
            body: SafeArea(
                child: Center(
                    child: Padding(
                        ///
                        /// wrap the column inside a padding to not make the button inside
                        /// the column stretch all the width and to be able to give it padding
                        ///
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                        ),
                        child: SingleChildScrollView(
                            ///
                            /// wrap the column inside a single child scroll view to make the column
                            /// scrollable in case the app is running on a small screen
                            ///
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                ///
                                /// this makes the widget inside of the column stretch all the way
                                /// from left to right taking the full width
                                ///
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    const Icon(
                                        MdiIcons.github, 
                                        size: 150,
                                    ),
                                    const SizedBox(
                                        height: 16,
                                    ),
                                    Text(
                                        'Welcome to\n Repo Viewer',
                                        style: Theme.of(context).textTheme.headline3,
                                        textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                        height: 20,
                                    ),
                                    ElevatedButton(
                                        child: const Text ('Sign In'),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.green),
                                        ),
                                        onPressed: () {
                                            context.read(authNotifierProvider.notifier).signIn(
                                                ///
                                                /// this authorizationUrl is what i passed to the function
                                                /// which's a parameter inside the signIn()
                                                ///
                                                (authorizationUrl) {
                                                    ///
                                                    /// - the completer will return us a uri
                                                    /// 
                                                    /// - we gonna need this cause the onAuthorizationCodeRedirectAttempt
                                                    ///   method will return us the redirected url uri but 
                                                    ///   synchronously and that logically that function will happen 
                                                    ///   in the future when the web view redirect to that url
                                                    ///   so we need that redirected url uri to be in a future form
                                                    ///   and that's what completer does for us
                                                    ///
                                                    final completer = Completer<Uri>();

                                                    AutoRouter.of(context).push(
                                                        AuthorizationRoute(
                                                            ///
                                                            /// - we will send the authorizationUrl to this
                                                            ///   AuthorizationRoute to display that url
                                                            ///   inside its web view
                                                            /// 
                                                            /// - that web view will return a redirect url
                                                            ///   which we will take from the 
                                                            ///   onAuthorizationCodeRedirectAttempt function
                                                            /// 
                                                            /// - that redirect url will be returned to the 
                                                            ///   signIn() function using the completer
                                                            authorizationUrl: authorizationUrl,
                                                            onAuthorizationCodeRedirectAttempt: (redirectUrl) {
                                                                ///
                                                                /// signIn() returns a redirect uri in a future
                                                                /// so we need to return this redirect url into
                                                                /// a future and completer does that for us
                                                                ///
                                                                completer.complete(redirectUrl);
                                                            }
                                                        )
                                                    );

                                                    return completer.future;
                                                }
                                            );
                                        },
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}