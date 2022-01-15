import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

import '../application/auth_notifier.dart';
import '../application/auth_state.dart';
import '../infrastructure/credentials_storage/credentials_storage.dart';
import '../infrastructure/credentials_storage/secure_credentials_storage.dart';
import '../infrastructure/datasource/github_authenticator.dart';
import '../infrastructure/interceptors/oauth2_interceptor.dart';

final dioForAuthProvider = Provider<Dio>(
    (ref) => Dio(),
);

///
/// - we will use riverpod to provided the dependencies needed around the app for the class
/// 
/// - riverpod will solve the dependency injection between the class we used in this auth module
///

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
    (ref) => const FlutterSecureStorage(),
);

final credentialsStorageProvider = Provider<CredentialsStorage>(
    (ref) => SecureCredentialsStorage(
        ref.watch(flutterSecureStorageProvider),
    ),
);

final githubAuthenticatorProvider = Provider<GithubAuthenticator>(
    (ref) => GithubAuthenticator(
        ref.watch(credentialsStorageProvider), 
        ref.watch(dioForAuthProvider),
    ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(
        ref.watch(githubAuthenticatorProvider),
    ),
);

///
/// we added this initialization for this in her cause this interceptor is located
/// inside the auth feature of the app but we don't wanna use it in the requests
/// that happens in the auth feature
///
final oAuth2InterceptorProvider = Provider(
    (ref) => OAuth2Interceptor(
        ref.watch(githubAuthenticatorProvider), 
        ref.watch(authNotifierProvider.notifier), 
        ref.watch(dioForAuthProvider),
    ),
);