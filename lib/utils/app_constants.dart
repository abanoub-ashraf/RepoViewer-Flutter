class AppConstants {
    static const storageKey             = 'oauth2_credentials';

    static final authorizationEndpoint  = Uri.parse('https://github.com/login/oauth/authorize');
    static final tokenEndpoint          = Uri.parse('https://github.com/login/oauth/access_token');
    static final redirectUrl            = Uri.parse('http://localhost:3000/callback');
    static const scopes                 = ['read:user', 'repo']; 
}