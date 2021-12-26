import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/auth_failure.dart';

part 'auth_state.freezed.dart';

// typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

///
/// to make this freezed class:
/// ===========================
///     1- create it using funion code snippet then give a name to the class
/// 
///     2- import freezed_annotation package
/// 
///     3- create the part statement using ptf code snippet
///         - this contains the name of the file that the freezed package will generate
/// 
///     4- then create the cases/constructors names you want this class to have
///         - start with a private constructor case
/// 
///     5- then use the build runner command to generate the freezed file
///
@freezed
class AuthState with _$AuthState {
    const AuthState._();
    const factory AuthState.initial() = _Initial;
    const factory AuthState.unauthenticated() = _Unauthenticated;
    const factory AuthState.authenticated() = _Authenticated;
    const factory AuthState.failure(AuthFailure failure) = _Failure;
}