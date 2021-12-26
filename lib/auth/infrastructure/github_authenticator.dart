import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import '../../utils/debug_access_token.dart';

import '../../core/infrastructure/dio_extensions.dart';
import '../../core/shared/encoders.dart';
import '../../utils/app_constants.dart';
import '../../utils/config.dart';
import '../domain/auth_failure.dart';
import 'credentials_storage/credentials_storage.dart';
import 'github_authenticator_client.dart';

///
/// this class will do the authentication
///
class GithubAuthenticator {
    ///
    /// an instance of the CredentialsStorage interface
    ///
    final CredentialsStorage _credentialsStorage;

    final Dio _dio;

    GithubAuthenticator(
        this._credentialsStorage, 
        this._dio
    );
    
    ///
    /// - get the stored signed in token from the credentials storage
    ///
    Future<Credentials?> getSignedInCredentials() async {
        try {
            ///
            /// use the read() method of the credentials storage interface to get
            /// the stored credentials cause we want to return them in this function
            ///
            final storedCredentials = await _credentialsStorage.read();

            ///
            /// if the stored credentials is not null, check if they expired or not
            ///
            if (storedCredentials != null) {
                ///
                /// if they are expired and can be refreshed, then refresh them
                ///
                if (storedCredentials.canRefresh && storedCredentials.isExpired) {
                    final failureOrCredentials = await refresh(storedCredentials);

                    ///
                    /// - our refresh() function returns either type so we need to check
                    ///   the both sides that one of them might be returned 
                    /// 
                    /// - if the left side was returned which is the auth failure then return null
                    ///   and do nothing, if the right side was returned then return that side
                    ///   which is the new refreshed credentials
                    /// 
                    /// - if the right side was returned that return that side which is the new token
                    ///   cause that's what is this function doing
                    ///
                    return failureOrCredentials.fold(
                        (l) => null, 
                        (r) => r
                    );
                }           
            }
            
            return storedCredentials;
        } on PlatformException {
            return null;
        }
    }

    ///
    /// check if the user is signed in, by returning true if we got credentials from
    /// the getSignedInCredentials() function
    ///
    //! this bool will be used from inside the application layer to check and set the state
    //! wether to be authenticated or not
    //!
    Future<bool> isSignedIn() => getSignedInCredentials().then(
        (credentials) => credentials != null
    );

    ///
    /// - this is what's gonna make the sign in process
    /// 
    /// - this is gonna be called from the application layer from the state notifier
    /// 
    /// - AuthorizationCodeGrant is a class for obtaining credentials via an authorization code grant, 
    ///   This method of authorization involves sending the resource owner to the authorization server 
    ///   where they will authorize the client, They're then redirected back to your server, 
    ///   along with an authorization code, This is used to obtain [Credentials] and create 
    ///   a fully-authorized [Client].
    /// 
    /// - To use this class, you must first call [getAuthorizationUrl] to get the URL to which to 
    ///   redirect the resource owner, Then once they've been redirected back to your application, 
    ///   call [handleAuthorizationResponse] or [handleAuthorizationCode] to process 
    ///   the authorization server's response and construct a [Client].
    /// 
    /// - this code grant method will be used from state notifier in the application layer
    ///   and in there we will pass the return object of this method to a bunch of different methods
    ///   on of them is get authorization url method
    ///
    AuthorizationCodeGrant createGrant() {
        return AuthorizationCodeGrant(
            Config.clientID,
            AppConstants.authorizationEndpoint,
            AppConstants.tokenEndpoint,
            secret: Config.clientSecret,
            ///
            /// our own custom http client sub class that contains the application/json
            /// in the header so that we get a response in a json format, the response of 
            /// the access token
            ///
            httpClient: GithubAuthenticatorClient()
        );
    }

    ///
    /// - this is the first function that bring the authorization url that will give us a code 
    ///   that will be exchanged for access token in the next step
    ///   ((----- this part is in the 83th video in the course -----))
    /// 
    /// - this is the url that we will show to the user in a web view and it will give us a code
    ///   after the user type their username and password
    /// 
    /// - so this is the authorization url that's gonna load inside the web view
    ///   that will ask the user for their username and password,
    ///   then after the user type their data, we will get redirected to 
    ///   the redirect uri with the code that will be exchanged for token attached to it
    /// 
    /// - that code in the redirect uri will be passed to 
    ///   the handleAuthorizationResponse() function underneath it
    ///   and in there the oauth2 package will do the rest of the work
    ///
    //! this method will give the authorization url that the web view will open
    //! from inside the presentation layer
    //!
    Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
        ///
        /// 
        /// - Returns the URL to which the resource owner should be redirected to 
        ///   authorize this client.
        /// 
        /// - The resource owner will then be redirected to [redirect], which should point to 
        ///   a server controlled by the client, This redirect will have additional query parameters 
        ///   that should be passed to [handleAuthorizationResponse].
        /// 
        /// - The specific permissions being requested from the authorization server may be specified 
        ///   via [scopes], The scope strings are specific to the authorization server and may be found 
        ///   in its documentation. Note that you may not be granted access to every scope you request; 
        ///   you may check the [Credentials.scopes] field of [Client.credentials] to see which scopes 
        ///   you were granted.
        /// 
        /// - An opaque [state] string may also be passed that will be present in the query parameters 
        ///   provided to the redirect URL.
        /// 
        /// - It is a [StateError] to call this more than once.
        ///
        return grant.getAuthorizationUrl(
            AppConstants.redirectUrl, 
            scopes: AppConstants.scopes
        );
    }

    ///
    /// - this is the second function that will take the code from the redirect url
    ///   we redirected to by the webview and then exchange it into an access token
    /// 
    /// - handle the response of the authorization 
    ///   by return Unit which means nothing, if the auth is successfully
    ///   or return AuthFailure, if the authorization has failed
    /// 
    /// - Either is pretty much the same as Result Type in Swift
    /// 
    /// - if this function is done with no errors, it will save the token in 
    ///   the credential storage interface so that the class that implements that interface
    ///   can deal with that token
    /// 
    /// - the queryParams that this method will take are presented in the redirect url
    ///
    //! this method will take a grant and a query params from the redirected url (the params contains a code)
    //! then convert that code into token and save them in the storage credentials
    //!
    Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
        AuthorizationCodeGrant grant, 
        ///
        //! this query params will come from the redirect url that 
        //! the web view will redirect us to
        ///
        Map<String, String> queryParams
    ) async {
        try {
            ///
            /// - handleAuthorizationResponse() will exchange the code that's in the queryParams
            ///   with token that we gonna use for the rest of the api calls of the app
            ///   so we need to extract that token from that function
            /// 
            /// - handleAuthorizationResponse() is the function that will send the request
            ///   that will exchange the code with a token, and for that token to be delivered
            ///   to us in a json format we created a http client sub class and modified its header
            ///   to have application/json so we can get the response in the json format
            /// 
            /// - the queryParams contains the authorization code that will be exchanged 
            ///   into access token by this function grant.handleAuthorizationResponse()
            ///   we don't need to implement it ourselves
            /// 
            /// - this method returns a client and that client has the access token we're
            ///   interested in
            ///
            final httpClient = await grant.handleAuthorizationResponse(queryParams);

            printAccessToken(httpClient.credentials.accessToken);

            ///
            /// - save the token we got from the handleAuthorizationResponse()
            ///   into our credentialStorage
            /// 
            /// - httpClient contains the proper access token that we got after the queryParams
            ///   are exchanged to them
            ///
            await _credentialsStorage.save(
                httpClient.credentials
            );

            ///
            /// right() means the right side of the 2 things in the Either keyword
            /// which is unit which means void cause everything is done successfully
            ///
            return right(unit);
        } on FormatException {
            ///
            /// - handleAuthorizationResponse() can throw FormatException and AuthorizationException
            ///   so both of them needs to be handled inside this try catch block
            /// 
            /// - left() means the left side of the 2 things in the Either keyword
            ///   which is AuthFailure and we call server() on it cause that exception
            ///   comes from the server
            ///
            return left(
                const AuthFailure.server()
            );
        } on AuthorizationException catch(exception) {
            ///
            /// this exception also comes from the server as well 
            ///
            return left(
                AuthFailure.server('${exception.error}: ${exception.description}')
            );
        } on PlatformException {
            ///
            /// - save() also throw this exception so it needs to be handled as well
            /// 
            /// - call the storage() cause this exception comes from the storage not the server
            ///
            return left(
                const AuthFailure.storage()
            );
        }
    }

    ///
    /// - sign the user out by deleting the token so that when the user sign in again 
    ///   they receive a new token and also by clearing the credentials storage
    /// 
    /// - handle the signing out when the user is offline 
    ///
    Future<Either<AuthFailure, Unit>> signOut() async {
        ///
        /// get the current valid token of the current logged in user from the storage that 
        /// we wanna revoke for signing that user out
        ///
        final accessToken = await _credentialsStorage
            .read()
            .then((credentials) => credentials?.accessToken);

        ///
        /// - this is the client id and the client secret in a form of base64 to be passed
        ///   to the delete request down there in its header
        /// 
        /// - the client id and the client secret are strings and the base64.encode()
        ///   takes a list of int so we need to change their string format
        ///   into list of int and that's what utf8.encode() method does
        /// 
        /// - this is exactly the same as he line beneath it
        ///
        final usernameAndPassword = stringToBase64.encode(
            '${Config.clientID}:${Config.clientSecret}'
        );

        ///
        /// - the line above this one is the exact same thing as this one
        /// 
        /// - stringToBase64 is mix of the 2 encode() methods we used to make this base64
        ///
        // final usernameAndPassword = base64.encode(
        //     utf8.encode(
        //         '${Config.clientID}:${Config.clientSecret}'
        //     )
        // );

        ///
        /// - we gonna handle the sign out when the user is offline through
        ///   the socket exception that happens when there's no internet connection
        /// 
        /// - putting the delete request in a separate try block makes sure that
        ///   clearing the token from the credentials storage is independent
        ///
        try {
            ///
            /// if the user is offline the sign out will fail to delete the token
            /// and that will be caught in the socket exception, 
            /// but the clear() will still be executed
            ///
            try {
                ///
                /// - revoking the token happens through a web request
                /// 
                /// - it takes the token we wanna delete in the body of the request
                ///   which is here the data and it's a map of string and string
                /// 
                /// - it also takes the client id and the client secret in the header
                ///   as an authorization header in base64 format
                ///
                _dio.deleteUri(
                    AppConstants.revocationEndpoint, 
                    data: {
                        'access_token': accessToken
                    },
                    options: Options(
                        headers: {
                            'Authorization': 'basic $usernameAndPassword'
                        },
                    )
                );
            } on DioError catch(exception) {
                ///
                /// - the socket exception in dio should be caught this way, not just typing
                ///   on SocketException inside the catch block
                /// 
                /// - the isNoConnectionError coming from dio extensions file we created
                ///
                if (exception.isNoConnectionError) {
                    printTokenIsNotRevoked();
                } else {
                    rethrow;
                }
            }

            await _credentialsStorage.clear();
            
            return right(unit);
        } on PlatformException {
            return left(
                const AuthFailure.storage()
            );
        }
    }

    ///
    /// - this method will refresh the old expired token that we have, so it needs 
    ///   that old token as a parameter
    /// 
    /// - this method will throw a state error if the credentials can't be refreshed
    ///   but we don't need to catch that exception cause we will call this method only
    ///   in the case that the credentials can be refreshed
    /// 
    /// - this method wil return the new refreshed credentials access token
    ///   and we need to save them in the credentials storage cause that storage
    ///   should contain the latest credentials access token
    ///
    Future<Either<AuthFailure, Credentials>> refresh(Credentials credentials) async {
        try {
            final refreshedCredentials = await credentials.refresh(
                identifier: Config.clientID,
                secret: Config.clientSecret,
                httpClient: GithubAuthenticatorClient()
            );

            ///
            /// save the newly refreshed token in the credentials storage
            ///
            await _credentialsStorage.save(refreshedCredentials);
            
            return right(refreshedCredentials);
        } on FormatException {
            return left(
                const AuthFailure.server()
            );
        } on AuthorizationException catch (exception) {
            return left(
                AuthFailure.server('${exception.error}: ${exception.description}')
            );
        } on PlatformException {
            return left(
                const AuthFailure.storage()
            );
        }
    }
}