import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/app_constants.dart';

///
/// this is the page that will hold the web view that's gonna load once 
/// the sign in button from the sign in page is pressed 
///
class AuthorizationPage extends StatefulWidget {
    ///
    /// this url will be shown in the web view
    ///
    final Uri authorizationUrl;
    ///
    /// this function will give us the redirect url we get from the web view with authorization code 
    /// from this page and give it back to the sign in page to be used inside the body of 
    /// the sign() method of the application layer  
    ///
    final void Function(Uri redirectUrl) onAuthorizationCodeRedirectAttempt;

    const AuthorizationPage({ 
        Key? key,
        required this.authorizationUrl,
        required this.onAuthorizationCodeRedirectAttempt,
    }) : super(key: key);

    @override
    _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
    @override
    void initState() {
        super.initState();

        ///
        /// to fix not so important issue in the web view with android
        ///
        if (Platform.isAndroid) {
            WebView.platform = SurfaceAndroidWebView();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                ///
                /// this web view comes from the webview flutter package 
                ///
                child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    ///
                    /// initial url is the url that the web view will load
                    ///
                    initialUrl: widget.authorizationUrl.toString(),
                    ///
                    /// once the web view is created clear the old cached data
                    /// and clear the cookies as well
                    ///
                    onWebViewCreated: (controller) {
                        controller.clearCache();
                        CookieManager().clearCookies();
                    },
                    ///
                    /// - this delegate is called when the webview is about to redirect the user to
                    ///   the redirect url
                    /// 
                    /// - if the redirect url starts with our redirect url constant then pass that
                    ///   redirect url to the onAuthorizationCodeRedirectAttempt method above
                    ///   to send it back to the signIn() method inside the sign in page 
                    ///
                    navigationDelegate: (navigationRequest) {
                        if (navigationRequest.url.startsWith(AppConstants.redirectUrl.toString())) {
                            widget.onAuthorizationCodeRedirectAttempt(
                                Uri.parse(navigationRequest.url)
                            );

                            ///
                            /// prevent the navigation to the redirect url from happening
                            /// we just want the code in that url and that's it
                            ///
                            return NavigationDecision.prevent;
                        }

                        ///
                        /// if we navigating to another url than the redirect one
                        /// let that navigation happens
                        ///
                        return NavigationDecision.navigate;
                    },
                ),
            ),
        );
    }
}