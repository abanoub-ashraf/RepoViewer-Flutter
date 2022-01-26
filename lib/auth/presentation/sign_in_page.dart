import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../core/presentation/routes/app_router.gr.dart';
import '../shared/providers.dart';

///
/// this [presentation layer] will use the functions of the [application layer]
///
class SignInPage extends StatelessWidget {
    const SignInPage({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Center(
                    child: Padding(
                        ///
                        /// wrap the column inside a padding to not make the button inside
                        /// the column stretch all the width and to be able to give it padding
                        ///
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48.0,
                        ),
                        child: SingleChildScrollView(
                            child: Column(
                                ///
                                /// wrap the column inside a single child scroll view to make the column
                                /// scrollable in case the app is running on a small screen
                                ///
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
                                    Text(
                                        'Welcome to\nRepo Viewer',
                                        style: Theme.of(context).textTheme.headline3,
                                        textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                        height: 32,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                            context
                                                .read(authNotifierProvider.notifier)
                                                ///
                                                /// this method comes from the application layer
                                                ///
                                                .signIn(
                                                    ///
                                                    /// this authorization url is the url that will be displayed in the web view
                                                    ///
                                                    //! the redirect url that will be returned from this block will be used
                                                    //! inside the body of the signIn() method in the 
                                                    //! [final redirectUrl = await authorizationCallback()]
                                                    //! and the body of the [await authorizationCallback()] is this block
                                                    //! we currently in in this file
                                                    //!
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
                                                            ///
                                                            /// this route will open the web view and give us 
                                                            /// the redirected url that the web view will redirect to 
                                                            ///
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
                                                                ///
                                                                /// - this function will be fired rom inside this route
                                                                ///   from the web view in there and it will give us 
                                                                ///   a redirected url with authorization code
                                                                ///
                                                                /// - we will get this redirect url from inside
                                                                ///   the Authorization page throw this constructor 
                                                                ///
                                                                onAuthorizationCodeRedirectAttempt: (redirectedUrl) {
                                                                    ///
                                                                    /// signIn() returns a redirect uri in a future
                                                                    /// so we need to return this redirect url into
                                                                    /// a future and completer does that for us
                                                                    ///
                                                                    completer.complete(redirectedUrl);
                                                                }
                                                            )
                                                        );

                                                        ///
                                                        /// this is the redirect url that this signIn()
                                                        /// will return, to be used inside the signIn() itself
                                                        ///
                                                        return completer.future;
                                                    }
                                                );
                                        }, 
                                        child: const Text('Sign In'),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                Colors.green
                                            ),
                                        ),
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