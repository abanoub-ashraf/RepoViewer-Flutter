import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationPage extends StatefulWidget {
    ///
    /// this url will be shown in the web view
    ///
    final Uri authorizationUrl;
    ///
    /// -
    ///
    final void Function(Uri redirectUrl) onAuthorizationCodeRedirectAttempt;

    const AuthorizationPage({ 
        Key? key,
        required this.authorizationUrl,
        required this.onAuthorizationCodeRedirectAttempt 
    }) : super(key: key);

    @override
    _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                ///
                /// this web view comes from the webview flutter package
                ///
                child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.authorizationUrl.toString(),
                ),
            ),
        );
    }
}