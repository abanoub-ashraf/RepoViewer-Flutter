// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_headers_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubHeadersDTO _$GithubHeadersDTOFromJson(Map<String, dynamic> json) {
  return _GithubHeadersDTO.fromJson(json);
}

/// @nodoc
class _$GithubHeadersDTOTearOff {
  const _$GithubHeadersDTOTearOff();

  _GithubHeadersDTO call({String? etag, PaginationLinkHeader? link}) {
    return _GithubHeadersDTO(
      etag: etag,
      link: link,
    );
  }

  GithubHeadersDTO fromJson(Map<String, Object> json) {
    return GithubHeadersDTO.fromJson(json);
  }
}

/// @nodoc
const $GithubHeadersDTO = _$GithubHeadersDTOTearOff();

/// @nodoc
mixin _$GithubHeadersDTO {
  ///
  /// this is nullable because not every api response may come with an etag
  /// and same as with the pagination link
  ///
  String? get etag => throw _privateConstructorUsedError;
  PaginationLinkHeader? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubHeadersDTOCopyWith<GithubHeadersDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubHeadersDTOCopyWith<$Res> {
  factory $GithubHeadersDTOCopyWith(
          GithubHeadersDTO value, $Res Function(GithubHeadersDTO) then) =
      _$GithubHeadersDTOCopyWithImpl<$Res>;
  $Res call({String? etag, PaginationLinkHeader? link});

  $PaginationLinkHeaderCopyWith<$Res>? get link;
}

/// @nodoc
class _$GithubHeadersDTOCopyWithImpl<$Res>
    implements $GithubHeadersDTOCopyWith<$Res> {
  _$GithubHeadersDTOCopyWithImpl(this._value, this._then);

  final GithubHeadersDTO _value;
  // ignore: unused_field
  final $Res Function(GithubHeadersDTO) _then;

  @override
  $Res call({
    Object? etag = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as PaginationLinkHeader?,
    ));
  }

  @override
  $PaginationLinkHeaderCopyWith<$Res>? get link {
    if (_value.link == null) {
      return null;
    }

    return $PaginationLinkHeaderCopyWith<$Res>(_value.link!, (value) {
      return _then(_value.copyWith(link: value));
    });
  }
}

/// @nodoc
abstract class _$GithubHeadersDTOCopyWith<$Res>
    implements $GithubHeadersDTOCopyWith<$Res> {
  factory _$GithubHeadersDTOCopyWith(
          _GithubHeadersDTO value, $Res Function(_GithubHeadersDTO) then) =
      __$GithubHeadersDTOCopyWithImpl<$Res>;
  @override
  $Res call({String? etag, PaginationLinkHeader? link});

  @override
  $PaginationLinkHeaderCopyWith<$Res>? get link;
}

/// @nodoc
class __$GithubHeadersDTOCopyWithImpl<$Res>
    extends _$GithubHeadersDTOCopyWithImpl<$Res>
    implements _$GithubHeadersDTOCopyWith<$Res> {
  __$GithubHeadersDTOCopyWithImpl(
      _GithubHeadersDTO _value, $Res Function(_GithubHeadersDTO) _then)
      : super(_value, (v) => _then(v as _GithubHeadersDTO));

  @override
  _GithubHeadersDTO get _value => super._value as _GithubHeadersDTO;

  @override
  $Res call({
    Object? etag = freezed,
    Object? link = freezed,
  }) {
    return _then(_GithubHeadersDTO(
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as PaginationLinkHeader?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubHeadersDTO extends _GithubHeadersDTO {
  const _$_GithubHeadersDTO({this.etag, this.link}) : super._();

  factory _$_GithubHeadersDTO.fromJson(Map<String, dynamic> json) =>
      _$$_GithubHeadersDTOFromJson(json);

  @override

  ///
  /// this is nullable because not every api response may come with an etag
  /// and same as with the pagination link
  ///
  final String? etag;
  @override
  final PaginationLinkHeader? link;

  @override
  String toString() {
    return 'GithubHeadersDTO(etag: $etag, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubHeadersDTO &&
            (identical(other.etag, etag) ||
                const DeepCollectionEquality().equals(other.etag, etag)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(link);

  @JsonKey(ignore: true)
  @override
  _$GithubHeadersDTOCopyWith<_GithubHeadersDTO> get copyWith =>
      __$GithubHeadersDTOCopyWithImpl<_GithubHeadersDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubHeadersDTOToJson(this);
  }
}

abstract class _GithubHeadersDTO extends GithubHeadersDTO {
  const factory _GithubHeadersDTO({String? etag, PaginationLinkHeader? link}) =
      _$_GithubHeadersDTO;
  const _GithubHeadersDTO._() : super._();

  factory _GithubHeadersDTO.fromJson(Map<String, dynamic> json) =
      _$_GithubHeadersDTO.fromJson;

  @override

  ///
  /// this is nullable because not every api response may come with an etag
  /// and same as with the pagination link
  ///
  String? get etag => throw _privateConstructorUsedError;
  @override
  PaginationLinkHeader? get link => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubHeadersDTOCopyWith<_GithubHeadersDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
