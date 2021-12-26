import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

import '../application/auth_notifier.dart';
import '../application/auth_state.dart';
import '../infrastructure/credentials_storage/credentials_storage.dart';
import '../infrastructure/credentials_storage/secure_credentials_storage.dart';
import '../infrastructure/github_authenticator.dart';

///
/// - we will use riverpod to provided the dependencies needed around the app for the class
/// 
/// - riverpod will solve the dependency injection between the class we used in this auth module
///

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
    (ref) => const FlutterSecureStorage()
);

final credentialsStorageProvider = Provider<CredentialsStorage>(
    (ref) => SecureCredentialsStorage(
        ref.watch(flutterSecureStorageProvider)
    )
);

final dioProvider = Provider<Dio>(
    (ref) => Dio()
);

final githubAuthenticatorProvider = Provider<GithubAuthenticator>(
    (ref) => GithubAuthenticator(
        ref.watch(credentialsStorageProvider), 
        ref.watch(dioProvider)
    )
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(
        ref.watch(githubAuthenticatorProvider)
    )
);