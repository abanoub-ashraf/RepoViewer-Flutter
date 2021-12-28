// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_owner_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepoOwnerDTO _$RepoOwnerDTOFromJson(Map<String, dynamic> json) {
  return _RepoOwnerDTO.fromJson(json);
}

/// @nodoc
class _$RepoOwnerDTOTearOff {
  const _$RepoOwnerDTOTearOff();

  _RepoOwnerDTO call(
      {@JsonKey(name: 'login') required String name,
      @JsonKey(name: 'avatar_url') required String avatarUrl}) {
    return _RepoOwnerDTO(
      name: name,
      avatarUrl: avatarUrl,
    );
  }

  RepoOwnerDTO fromJson(Map<String, Object> json) {
    return RepoOwnerDTO.fromJson(json);
  }
}

/// @nodoc
const $RepoOwnerDTO = _$RepoOwnerDTOTearOff();

/// @nodoc
mixin _$RepoOwnerDTO {
  ///
  /// - use this json key annotation to give these constructor fields the names of
  ///   the json fields that we want the generated dart fields to be the same
  ///
  /// - if we didn't do that, then the generated fields will have the names of these fields
  ///   i defined here inside this constructor, and the json response has different names
  ///   so these names will be wrong
  ///
  @JsonKey(name: 'login')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoOwnerDTOCopyWith<RepoOwnerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoOwnerDTOCopyWith<$Res> {
  factory $RepoOwnerDTOCopyWith(
          RepoOwnerDTO value, $Res Function(RepoOwnerDTO) then) =
      _$RepoOwnerDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'login') String name,
      @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$RepoOwnerDTOCopyWithImpl<$Res> implements $RepoOwnerDTOCopyWith<$Res> {
  _$RepoOwnerDTOCopyWithImpl(this._value, this._then);

  final RepoOwnerDTO _value;
  // ignore: unused_field
  final $Res Function(RepoOwnerDTO) _then;

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
abstract class _$RepoOwnerDTOCopyWith<$Res>
    implements $RepoOwnerDTOCopyWith<$Res> {
  factory _$RepoOwnerDTOCopyWith(
          _RepoOwnerDTO value, $Res Function(_RepoOwnerDTO) then) =
      __$RepoOwnerDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'login') String name,
      @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$RepoOwnerDTOCopyWithImpl<$Res> extends _$RepoOwnerDTOCopyWithImpl<$Res>
    implements _$RepoOwnerDTOCopyWith<$Res> {
  __$RepoOwnerDTOCopyWithImpl(
      _RepoOwnerDTO _value, $Res Function(_RepoOwnerDTO) _then)
      : super(_value, (v) => _then(v as _RepoOwnerDTO));

  @override
  _RepoOwnerDTO get _value => super._value as _RepoOwnerDTO;

  @override
  $Res call({
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_RepoOwnerDTO(
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
@JsonSerializable()
class _$_RepoOwnerDTO extends _RepoOwnerDTO {
  const _$_RepoOwnerDTO(
      {@JsonKey(name: 'login') required this.name,
      @JsonKey(name: 'avatar_url') required this.avatarUrl})
      : super._();

  factory _$_RepoOwnerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RepoOwnerDTOFromJson(json);

  @override

  ///
  /// - use this json key annotation to give these constructor fields the names of
  ///   the json fields that we want the generated dart fields to be the same
  ///
  /// - if we didn't do that, then the generated fields will have the names of these fields
  ///   i defined here inside this constructor, and the json response has different names
  ///   so these names will be wrong
  ///
  @JsonKey(name: 'login')
  final String name;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'RepoOwnerDTO(name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RepoOwnerDTO &&
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
  _$RepoOwnerDTOCopyWith<_RepoOwnerDTO> get copyWith =>
      __$RepoOwnerDTOCopyWithImpl<_RepoOwnerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoOwnerDTOToJson(this);
  }
}

abstract class _RepoOwnerDTO extends RepoOwnerDTO {
  const factory _RepoOwnerDTO(
          {@JsonKey(name: 'login') required String name,
          @JsonKey(name: 'avatar_url') required String avatarUrl}) =
      _$_RepoOwnerDTO;
  const _RepoOwnerDTO._() : super._();

  factory _RepoOwnerDTO.fromJson(Map<String, dynamic> json) =
      _$_RepoOwnerDTO.fromJson;

  @override

  ///
  /// - use this json key annotation to give these constructor fields the names of
  ///   the json fields that we want the generated dart fields to be the same
  ///
  /// - if we didn't do that, then the generated fields will have the names of these fields
  ///   i defined here inside this constructor, and the json response has different names
  ///   so these names will be wrong
  ///
  @JsonKey(name: 'login')
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RepoOwnerDTOCopyWith<_RepoOwnerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
