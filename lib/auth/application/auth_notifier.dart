import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';

part 'auth_notifier.freezed.dart';

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

@freezed
class AuthState with _$AuthState {
    const AuthState._();
    const factory AuthState.initial() = _Initial;
    const factory AuthState.unauthenticated() = _Unauthenticated;
    const factory AuthState.authenticated() = _Authenticated;
    const factory AuthState.failure(AuthFailure failure) = _Failure;
}

class AuthNotifier extends StateNotifier<AuthState> {
    final GithubAuthenticator _authenticator;

    AuthNotifier(this._authenticator) : super(const AuthState.initial());

    ///
    /// - check if we're authenticated or not by checking if we're signed in or not
    ///
    /// - ( ) around the isSignedIn() make the future that's gonna be returned by it 
    ///   scoped around its bool value
    ///
    Future<void> checkAndUpdateAuthStatus() async {
        state = (await _authenticator.isSignedIn()) 
            ? const AuthState.authenticated() 
            : const AuthState.unauthenticated();
    }

    ///
    /// - in the presentation layer we will call this method on this AuthNotifier
    ///   and we will pass this authorizationCallback function to it,
    ///   that function takes the authorization url from the github authenticator
    ///   from the infrastructure layer and will give us the redirect url which contains
    ///   the code that will be exchanged for access token
    /// 
    /// - all the functions in this application layer will be called from the
    ///   presentation layer
    /// 
    /// - the web view in the presentation layer will call this signIn() method taking
    ///   the authorization url from the from the infrastructure layer and the web view will
    ///   give us a code in the redirect url which gonna be the output of the authorizationCallback 
    ///   function that was passed to this signIn() function as a parameter
    ///
    Future<void> signIn(AuthUriCallback authorizationCallback) async {
        ///
        /// 1- create the grant
        ///
        final grant = _authenticator.createGrant();
        
        ///
        /// 2- get the authorization url from the grant and give it to the authorizationCallback()
        ///    function which will give us the redirect url
        ///
        final redirectUrl = await authorizationCallback(
            _authenticator.getAuthorizationUrl(grant)
        );
        
        ///
        /// 3- pass the grant and the query params of the redirect url to this method
        ///    to take the code from the redirect url and exchange it for token
        ///    and save that token in the credentials storage
        /// 
        /// 4- this method will return either success or failure so we need to handle 
        ///    both cases in the next step
        ///
        final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
            grant, 
            redirectUrl.queryParameters
        );

        ///
        /// 5- if the handleAuthorizationResponse() returned failure then set state to failure
        ///    and if it returned Unit which is success then set state to authenticated  
        ///
        state = failureOrSuccess.fold(
            (l) => AuthState.failure(l), 
            (r) => const AuthState.authenticated()
        );

        ///
        /// 6- last step is to not forget to close the grant
        ///
        grant.close();
    }
}