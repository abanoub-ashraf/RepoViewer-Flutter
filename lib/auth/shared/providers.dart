import 'package:dio/dio.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';

final flutterSecureStorageProvider  = Provider((ref) => const FlutterSecureStorage());

final dioProvider                   = Provider((ref) => Dio());

final credentialsStorageProvider    = Provider<CredentialsStorage>(
    (ref) => SecureCredentialsStorage(
        ref.watch(flutterSecureStorageProvider)
    )
);

final githubAuthenticatorProvider   = Provider(
    (ref) => GithubAuthenticator(
        ref.watch(credentialsStorageProvider), 
        ref.watch(dioProvider)
    )
);

final authNotifierProvider          = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(
        ref.watch(githubAuthenticatorProvider)
    )
);