import 'package:http/http.dart' as http;

///
/// we need to send the header 'application/json' to the request and 
/// the handleAuthorizationResponse() function that will do that request takes  
///
class GithubAuthenticatorClient extends http.BaseClient {
    final httpClient = http.Client();

    ///
    /// - this is the function that performs the web request
    /// 
    /// - override the way we send the requests to include custom header so that
    ///   we can get the response in a json format
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