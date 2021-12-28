// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GithubRepoEntityTearOff {
  const _$GithubRepoEntityTearOff();

  _GithubRepoEntity call(
      {required RepoOwnerEntity owner,
      required String name,
      required String description,
      required int stargazersCount}) {
    return _GithubRepoEntity(
      owner: owner,
      name: name,
      description: description,
      stargazersCount: stargazersCount,
    );
  }
}

/// @nodoc
const $GithubRepoEntity = _$GithubRepoEntityTearOff();

/// @nodoc
mixin _$GithubRepoEntity {
  RepoOwnerEntity get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GithubRepoEntityCopyWith<GithubRepoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoEntityCopyWith<$Res> {
  factory $GithubRepoEntityCopyWith(
          GithubRepoEntity value, $Res Function(GithubRepoEntity) then) =
      _$GithubRepoEntityCopyWithImpl<$Res>;
  $Res call(
      {RepoOwnerEntity owner,
      String name,
      String description,
      int stargazersCount});

  $RepoOwnerEntityCopyWith<$Res> get owner;
}

/// @nodoc
class _$GithubRepoEntityCopyWithImpl<$Res>
    implements $GithubRepoEntityCopyWith<$Res> {
  _$GithubRepoEntityCopyWithImpl(this._value, this._then);

  final GithubRepoEntity _value;
  // ignore: unused_field
  final $Res Function(GithubRepoEntity) _then;

  @override
  $Res call({
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? stargazersCount = freezed,
  }) {
    return _then(_value.copyWith(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepoOwnerEntity,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: stargazersCount == freezed
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $RepoOwnerEntityCopyWith<$Res> get owner {
    return $RepoOwnerEntityCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$GithubRepoEntityCopyWith<$Res>
    implements $GithubRepoEntityCopyWith<$Res> {
  factory _$GithubRepoEntityCopyWith(
          _GithubRepoEntity value, $Res Function(_GithubRepoEntity) then) =
      __$GithubRepoEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {RepoOwnerEntity owner,
      String name,
      String description,
      int stargazersCount});

  @override
  $RepoOwnerEntityCopyWith<$Res> get owner;
}

/// @nodoc
class __$GithubRepoEntityCopyWithImpl<$Res>
    extends _$GithubRepoEntityCopyWithImpl<$Res>
    implements _$GithubRepoEntityCopyWith<$Res> {
  __$GithubRepoEntityCopyWithImpl(
      _GithubRepoEntity _value, $Res Function(_GithubRepoEntity) _then)
      : super(_value, (v) => _then(v as _GithubRepoEntity));

  @override
  _GithubRepoEntity get _value => super._value as _GithubRepoEntity;

  @override
  $Res call({
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? stargazersCount = freezed,
  }) {
    return _then(_GithubRepoEntity(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as RepoOwnerEntity,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: stargazersCount == freezed
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GithubRepoEntity extends _GithubRepoEntity {
  const _$_GithubRepoEntity(
      {required this.owner,
      required this.name,
      required this.description,
      required this.stargazersCount})
      : super._();

  @override
  final RepoOwnerEntity owner;
  @override
  final String name;
  @override
  final String description;
  @override
  final int stargazersCount;

  @override
  String toString() {
    return 'GithubRepoEntity(owner: $owner, name: $name, description: $description, stargazersCount: $stargazersCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubRepoEntity &&
            (identical(other.owner, owner) ||
                const DeepCollectionEquality().equals(other.owner, owner)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.stargazersCount, stargazersCount) ||
                const DeepCollectionEquality()
                    .equals(other.stargazersCount, stargazersCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(owner) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(stargazersCount);

  @JsonKey(ignore: true)
  @override
  _$GithubRepoEntityCopyWith<_GithubRepoEntity> get copyWith =>
      __$GithubRepoEntityCopyWithImpl<_GithubRepoEntity>(this, _$identity);
}

abstract class _GithubRepoEntity extends GithubRepoEntity {
  const factory _GithubRepoEntity(
      {required RepoOwnerEntity owner,
      required String name,
      required String description,
      required int stargazersCount}) = _$_GithubRepoEntity;
  const _GithubRepoEntity._() : super._();

  @override
  RepoOwnerEntity get owner => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  int get stargazersCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubRepoEntityCopyWith<_GithubRepoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
