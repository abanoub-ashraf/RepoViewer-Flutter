import 'package:dio/dio.dart';

import '../../application/auth_notifier.dart';
import '../datasource/github_authenticator.dart';

///
/// get the access token from the signed in credentials and pass them to 
/// the header of every dio http request
///
class OAuth2Interceptor extends Interceptor {
    final GithubAuthenticator _githubAuthenticator;
    final AuthNotifier _authNotifier;
    final Dio _dio;

    OAuth2Interceptor(
        this._githubAuthenticator, 
        this._authNotifier, 
        this._dio
    );
    
    ///
    /// this is for including the bearer access token to the header of all web requests we make
    ///
    @override
    Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
        ///
        /// get the credentials of the signed in user
        ///
        final credentials = await _githubAuthenticator.getSignedInCredentials();
        
        ///
        /// get the access token from the credentials we got above and
        /// pass them to the header of the request only if the credentials 
        /// is not null (still valid)
        ///
        final modifiedOptions = options..headers.addAll(
            credentials == null 
                ? {} 
                : {
                    'Authorization': 'bearer ${credentials.accessToken}', 
                },
        );
        
        ///
        /// - The callback will be executed before the request is initiated.
        /// 
        /// - If you want to continue the request, call [handler.next].
        /// 
        /// - If you want to complete the request with some custom data， 
        ///   you can resolve a [Response] object with [handler.resolve].
        /// 
        /// - If you want to complete the request with an error message, 
        ///   you can reject a [DioError] object with [handler.reject].
        /// 
        handler.next(modifiedOptions);
    }

    ///
    /// this is for handling specific errors happens on any web request we make
    ///
    @override
    Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
        ///
        /// if this is not null then the error is coming from the response
        /// not that it's a socket exception
        ///
        final errorResponse = err.response;

        ///
        /// - this method is for whenever an error happens
        /// 
        /// - we wanna handle the case when if the access token is invalid (401 error)
        ///   we wanna either refresh the token (not possible with github api) 
        ///   or clear the token and sign out
        ///
        if (errorResponse != null && errorResponse.statusCode == 401) {
            ///
            /// get the current used credentials in the request
            ///
            final credentials = await _githubAuthenticator.getSignedInCredentials();

            ///
            /// if the credentials are exist but invalid, and can be refreshed
            /// then refresh them (replace them with a new one and save it in the storage)
            /// else clear that credentials from the storage and sign out
            ///
            credentials != null && credentials.canRefresh 
                ///
                /// in case the api we dealing with supports refreshing token
                /// if there's a credentials and they can be refreshed
                /// then refresh them and rerun the request with the newly
                /// refreshed token
                ///
                ? await _githubAuthenticator.refresh(credentials) 
                ///
                /// - in case the credentials can't be refreshed then we wanna clear them
                ///   and show the login screen to the user 
                /// 
                /// - this will sign the user out after the checkAndUpdateAuthStatus()
                ///   function runs in the next line
                ///
                : await _githubAuthenticator.clearCredentialsStorage();

            ///
            /// - in case the credentials has been refreshed then nothing will change
            ///   cause the user is still signed in (authenticated)
            /// 
            /// - in case we cleared the credentials storage then this function will find out
            ///   that the user is signed out (no longer authenticated) and the user will be
            ///   navigated to the sign in screen
            /// 
            /// - auth notifier is the application layer and we calling it here in 
            ///   the infrastructure which is fine cause sometimes the infrastructure
            ///   layer can use the application layer functions
            ///
            await _authNotifier.checkAndUpdateAuthStatus();

            ///
            /// if we did refresh the token then it means we still signed in and now we wanna
            /// retry the request with the newly refreshed token added to the header of the request
            ///
            final refreshedCredentials = await _githubAuthenticator.getSignedInCredentials();

            ///
            /// - if we have a refreshed token then retry the request again
            ///
            /// - if we refreshed the token which means the user is still signed in
            ///   then we wanna retry the request that was previously returned 401 status code again 
            ///   but without its wrong header and instead, add the new header with the new token
            ///
            if (refreshedCredentials != null) {
                ///
                /// - Complete the request with Response object and other error interceptor(s) 
                ///   will not be executed. This will be considered a successful request!
                /// 
                /// - retry the request with its previous response with removing 
                ///   the header that caused the error from it
                ///
                handler.resolve(
                    ///
                    /// replace the invalid header of the old request with the newly refreshed
                    /// token and retry the request again with it
                    ///
                    await _dio.fetch(
                        errorResponse
                            .requestOptions
                            ..headers['Authorization'] = 'bearer ${refreshedCredentials.accessToken}'
                    ),
                );
            }
        } else {
            ///
            /// if we have a different error with different status code
            /// we will pass that error to the next error interceptor
            /// or just make it available inside of the app to be caught properly
            ///
            handler.next(err);
        }
    }
}