import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oauth2/oauth2.dart';
import 'credentials_storage.dart';
import '../../../utils/app_constants.dart';

///
/// this is the implementation of the credentials storage for the mobile devices
///
class SecureCredentialsStorage implements CredentialsStorage {
    ///
    /// the storage of the device that we will read from and write to
    ///
    final FlutterSecureStorage _storage;

    ///
    /// for saving the credentials in the cache when i save them in the device storage 
    ///
    Credentials? _cachedCredentials;

    SecureCredentialsStorage(
        this._storage
    );

    @override
    Future<Credentials?> read() async {
        ///
        /// first read from the cache, 
        /// if the cached credentials is not null then return that cached credentials
        ///
        if (_cachedCredentials != null) {
            return _cachedCredentials;
        }

        ///
        /// we also need to read the storage cause we won't always have the credentials cached
        ///
        final json = await _storage.read(
            key: AppConstants.storageKey
        );

        ///
        /// in case the app is running for the first time or the user is signed out then sign in again
        /// the json in that case will be null
        ///
        if (json == null) {
            return null;
        }

        try {
            ///
            /// we put this inside try catch blocks cause fromJson() throw exception
            ///
            return _cachedCredentials = Credentials.fromJson(json);
        } on FormatException {
            return null;
        }
    }

    @override
    Future<void> save(Credentials credentials) {
        ///
        /// save the credentials in the cache then in the device storage as well
        ///
        _cachedCredentials = credentials;

        ///
        /// and save in the secure credential storage
        ///
        return _storage.write(
            key: AppConstants.storageKey, 
            value: credentials.toJson()
        );
    }

    @override
    Future<void> clear() {
        _cachedCredentials = null;

        return _storage.delete(
            key: AppConstants.storageKey
        );
    }
}