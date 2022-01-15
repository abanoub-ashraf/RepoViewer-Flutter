import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../infrastructure/datasource/github_authenticator.dart';

import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
    ///
    /// this auth notifier [application layer] will use the functions of the authenticator
    /// [infrastructure layer]
    ///
    final GithubAuthenticator _authenticator;

    ///
    /// this initial state is the first state till the app check for the credentials
    /// to determine whether we are authenticated or not
    ///
    AuthNotifier(
        this._authenticator
    ) : super(
        const AuthState.initial()
    );

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
    /// the sign in process:
    /// ====================
    ///     1- [final grant = _authenticator.createGrant();] will start the sign in process
    /// 
    ///     2- [_authenticator.getAuthorizationUrl(grant)] will give us a redirect url with code
    ///        attached to it
    /// 
    ///     3- await _authenticator.handleAuthorizationResponse() will get that code then exchange
    ///        it for token then save that token in the credentials storage and then it will return
    ///        unit if everything went fine or auth failure if something went wrong 
    /// 
    ///     4- failureOrSuccess.fold() this will check what was returned from step 3 above
    ///        if auth failure was returned then it will be transformed into a failure state
    ///        and that's what will be given to the presentation layer, if unit was returned
    ///        then authenticated state will be sent to the presentation layer instead
    ///
    /// ===========================================================================================
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
    /// - this signIn method is gonna use all the three methods of the signing in process of the 
    ///   infrastructure layer, which are createGrant, getAuthorizationUrl, handleAuthorizationResponse
    ///
    //! - this method will take authorization url in the [await authorizationCallback()]
    //!   and that url will be given when i call this sign in method from the presentation layer
    //!
    //! - [_authenticator.getAuthorizationUrl(grant)] will give us the authorization url
    //! 
    //! - final redirectUrl is the url that the web view will redirect us to and a code will be
    //!   attached to that url as well
    //!
    //! - [_authenticator.handleAuthorizationResponse] will take the grant and the query params
    //!   with the code in it and convert it into token and store them in the credentials
    //!
    Future<void> signIn(Future<Uri> Function(Uri authorizationUrl) authorizationCallback) async {
        ///
        /// 1- create the grant
        ///
        final grant = _authenticator.createGrant();
        
        ///
        /// 2- get the authorization url from the grant and give it to the authorizationCallback()
        ///    function which will give us the redirect url with the code attached to it
        /// 
        /// - this redirect url has a code that will be exchanged for tokens next
        /// 
        /// - this redirect url will be sent to the presentation layer when we call this 
        ///   signIn method from there so that the presentation layer can open the web view with it
        ///   and also will be sent to the _authenticator.handleAuthorizationResponse in here to
        ///   extract the code from it and exchange that code with token and save them in the 
        ///   secure storage
        /// 
        /// - whatever this callback takes as a param is what will be given to me when i call
        /// this signIn() method from the presentation layer not the final redirectUrl
        ///
        //! what this callback takes as a param will be given to me as a param in the call site
        //! of this signIn function, that's how callbacks work
        //!
        //! this redirectUrl final variable will come from the web view
        //! the signIn() function will be called from the presentation layer with authorization url
        //! given to it and that block (authorizationUrl) {} in there will be the body of this
        //! await authorizationCallback() and is the one that will give us this final redirectUrl
        //!
        //! the body of the authorizationUrl block in the signIn method in the presentation layer
        //! is the body of this await authorizationCallback()
        //!
        final redirectUrl = await authorizationCallback(
            ///
            /// 1- [final grant = _authenticator.createGrant();] will start the sign in process
            /// 
            /// 2- [_authenticator.getAuthorizationUrl(grant)] will give us a redirect url with code
            ///    attached to it
            /// 
            /// 3- await _authenticator.handleAuthorizationResponse() will get that code then exchange
            ///   it for token then save that token in the credentials storage and then it will return
            ///   unit if everything went fine or auth failure if something went wrong 
            /// 
            /// 4- failureOrSuccess.fold() this will check what was returned from step 3 above
            ///    if auth failure was returned then it will be transformed into a failure state
            ///    and that's what will be given to the presentation layer, if unit was returned
            ///    then authenticated state will be sent to the presentation layer instead
            /// 
            /// ------ this authorizationCallback() takes an authorization url which is 
            /// _authenticator.getAuthorizationUrl(grant) and so when we call this signIn() method
            /// from thr presentation layer, this authorization url will be given in there
            ///
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
        /// - pass the redirect url we got above to this authenticator function cause that
        ///   url has code attached to it and we want to convert it into tokens and that's
        ///   what will happens here
        ///
        //! this handleAuthorizationResponse() will take the query params of the redirect url
        //! that the web view will redirect us to
        //!
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

    Future<void> signOut() async {
        final failureOrSuccess = await _authenticator.signOut();

        state = failureOrSuccess.fold(
            (failure) => AuthState.failure(failure), 
            (signedOut) => const AuthState.unauthenticated()
        );
    }
}