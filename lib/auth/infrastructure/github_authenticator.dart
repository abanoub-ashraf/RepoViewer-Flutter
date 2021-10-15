import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart';
import 'package:print_color/print_color.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:repo_viewer/core/shared/encoders.dart';
import 'package:repo_viewer/utils/app_constants.dart';
import 'package:repo_viewer/utils/config.dart';

///
/// we need to send the header 'application/json' to the request and 
/// the handleAuthorizationResponse() function that will do that request takes  
///
class GithubOAuthHttpClient extends http.BaseClient {
    final httpClient = http.Client();

    ///
    /// this is the function that performs the web request
    ///
    @override
    Future<http.StreamedResponse> send(http.BaseRequest request) {
        ///
        /// modify the header of this request so we can get a json response for the access token
        /// we gonna get from the oauth endpoint
        ///
        request.headers['Accept'] = 'application/json';
        ///
        /// now we wanna send the modified request object above to the default http client
        /// like this
        ///
        return httpClient.send(request);
    }
}

///
/// this class will do the authentication
///
class GithubAuthenticator {
    ///
    /// an instance of the CredentialsStorage interface
    ///
    final CredentialsStorage _credentialsStorage;

    final Dio _dio;

    GithubAuthenticator(this._credentialsStorage, this._dio);
    
    ///
    /// store the login credentials on the device
    ///
    Future<Credentials?> getSignedInCredentials() async {
        try {
            ///
            /// use the read() method of the credentials storage interface to get
            /// the stored credentials cause we want to return them in this function
            ///
            final storedCredentials = await _credentialsStorage.read();

            if (storedCredentials != null) {
                if (storedCredentials.canRefresh && storedCredentials.isExpired) {
                    /// TODO: refresh
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
    Future<bool> isSignedIn() => getSignedInCredentials().then(
        (credentials) => credentials != null
    );

    ///
    /// - this is what's gonna make the sign in process
    /// 
    /// - this is gonna be called from the application layer from the state notifier
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
            httpClient: GithubOAuthHttpClient()
        );
    }

    ///
    /// 
    ///
    Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
        return grant.getAuthorizationUrl(
            AppConstants.redirectUrl, 
            scopes: AppConstants.scopes
        );
    }

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
    Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
        AuthorizationCodeGrant grant, 
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
            final httpClient = await grant.handleAuthorizationResponse(queryParams);

            ///
            /// save the token we got from the handleAuthorizationResponse()
            /// into our credentialStorage
            ///
            await _credentialsStorage.save(httpClient.credentials);

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
            return left(const AuthFailure.server());
        } on AuthorizationException catch(exception) {
            ///
            /// this exception also comes from the server as well 
            ///
            return left(AuthFailure.server('${exception.error}: ${exception.description}'));
        } on PlatformException {
            ///
            /// - save() also throw this exception so it needs to be handled as well
            /// 
            /// - call the storage() cause this exception comes from the storage not the server
            ///
            return left(const AuthFailure.storage());
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
        final usernameAndPassword = stringToBase64.encode(
            '${Config.clientID}:${Config.clientSecret}'
        );

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
                        }
                    )
                );
            } on DioError catch(exception) {
                ///
                /// the socket exception in dio should be caught this way, not just typing
                /// on SocketException inside the catch block
                ///
                if (exception.type == DioErrorType.other && exception.error is SocketException) {
                    Print.red('===============================================');
                    Print.red('Token is not Revoked!');
                    Print.red('===============================================');
                } else {
                    rethrow;
                }
            }

            await _credentialsStorage.clear();
            
            return right(unit);
        } on PlatformException {
            return left(const AuthFailure.storage());
        }
    }
}