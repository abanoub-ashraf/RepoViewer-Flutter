import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

///
/// - union class using freezed package
/// 
/// - this will handle the auth failure when it happens
/// 
/// - this comes from the infrastructure through the domain going to the application
///
@freezed
class AuthFailure with _$AuthFailure {
    const AuthFailure._();
    const factory AuthFailure.server([String? message]) = _Server;
    const factory AuthFailure.storage() = _Storage;
}