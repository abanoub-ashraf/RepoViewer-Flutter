import 'package:repo_viewer/utils/config.dart';

class AppConstants {
    static const storageKey             = 'oauth2_credentials';

    static const baseUrl                = 'https://github.com';
    static const apiUrl                 = 'https://api.github.com';

    static final authorizationEndpoint  = Uri.parse('$baseUrl/login/oauth/authorize');
    static final tokenEndpoint          = Uri.parse('$baseUrl/login/oauth/access_token');
    static final revocationEndpoint     = Uri.parse('$apiUrl/applications/${Config.clientID}/token');
    static final redirectUrl            = Uri.parse('http://localhost:3000/callback');
    static const scopes                 = ['read:user', 'repo']; 

    static const appName                = 'Repo Viewer';
}