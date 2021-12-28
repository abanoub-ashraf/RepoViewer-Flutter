// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_owner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepoOwnerEntityTearOff {
  const _$RepoOwnerEntityTearOff();

  _RepoOwnerEntity call({required String name, required String avatarUrl}) {
    return _RepoOwnerEntity(
      name: name,
      avatarUrl: avatarUrl,
    );
  }
}

/// @nodoc
const $RepoOwnerEntity = _$RepoOwnerEntityTearOff();

/// @nodoc
mixin _$RepoOwnerEntity {
  String get name => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoOwnerEntityCopyWith<RepoOwnerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoOwnerEntityCopyWith<$Res> {
  factory $RepoOwnerEntityCopyWith(
          RepoOwnerEntity value, $Res Function(RepoOwnerEntity) then) =
      _$RepoOwnerEntityCopyWithImpl<$Res>;
  $Res call({String name, String avatarUrl});
}

/// @nodoc
class _$RepoOwnerEntityCopyWithImpl<$Res>
    implements $RepoOwnerEntityCopyWith<$Res> {
  _$RepoOwnerEntityCopyWithImpl(this._value, this._then);

  final RepoOwnerEntity _value;
  // ignore: unused_field
  final $Res Function(RepoOwnerEntity) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RepoOwnerEntityCopyWith<$Res>
    implements $RepoOwnerEntityCopyWith<$Res> {
  factory _$RepoOwnerEntityCopyWith(
          _RepoOwnerEntity value, $Res Function(_RepoOwnerEntity) then) =
      __$RepoOwnerEntityCopyWithImpl<$Res>;
  @override
  $Res call({String name, String avatarUrl});
}

/// @nodoc
class __$RepoOwnerEntityCopyWithImpl<$Res>
    extends _$RepoOwnerEntityCopyWithImpl<$Res>
    implements _$RepoOwnerEntityCopyWith<$Res> {
  __$RepoOwnerEntityCopyWithImpl(
      _RepoOwnerEntity _value, $Res Function(_RepoOwnerEntity) _then)
      : super(_value, (v) => _then(v as _RepoOwnerEntity));

  @override
  _RepoOwnerEntity get _value => super._value as _RepoOwnerEntity;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_RepoOwnerEntity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RepoOwnerEntity extends _RepoOwnerEntity {
  const _$_RepoOwnerEntity({required this.name, required this.avatarUrl})
      : super._();

  @override
  final String name;
  @override
  final String avatarUrl;

  @override
  String toString() {
    return 'RepoOwnerEntity(name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RepoOwnerEntity &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(avatarUrl);

  @JsonKey(ignore: true)
  @override
  _$RepoOwnerEntityCopyWith<_RepoOwnerEntity> get copyWith =>
      __$RepoOwnerEntityCopyWithImpl<_RepoOwnerEntity>(this, _$identity);
}

abstract class _RepoOwnerEntity extends RepoOwnerEntity {
  const factory _RepoOwnerEntity(
      {required String name, required String avatarUrl}) = _$_RepoOwnerEntity;
  const _RepoOwnerEntity._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get avatarUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RepoOwnerEntityCopyWith<_RepoOwnerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
