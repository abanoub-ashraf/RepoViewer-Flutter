import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

///
/// - union class using freezed package
/// 
/// - this will handle the auth failure when it happens
///
@freezed
class AuthFailure with _$AuthFailure {
    const AuthFailure._();
    const factory AuthFailure.server([String? message]) = _Server;
    const factory AuthFailure.storage() = _Storage;
}