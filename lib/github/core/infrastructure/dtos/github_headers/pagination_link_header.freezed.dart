// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_link_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationLinkHeader _$PaginationLinkHeaderFromJson(Map<String, dynamic> json) {
  return _PaginationLinkHeader.fromJson(json);
}

/// @nodoc
class _$PaginationLinkHeaderTearOff {
  const _$PaginationLinkHeaderTearOff();

  _PaginationLinkHeader call({required int maxPage}) {
    return _PaginationLinkHeader(
      maxPage: maxPage,
    );
  }

  PaginationLinkHeader fromJson(Map<String, Object> json) {
    return PaginationLinkHeader.fromJson(json);
  }
}

/// @nodoc
const $PaginationLinkHeader = _$PaginationLinkHeaderTearOff();

/// @nodoc
mixin _$PaginationLinkHeader {
  int get maxPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationLinkHeaderCopyWith<PaginationLinkHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationLinkHeaderCopyWith<$Res> {
  factory $PaginationLinkHeaderCopyWith(PaginationLinkHeader value,
          $Res Function(PaginationLinkHeader) then) =
      _$PaginationLinkHeaderCopyWithImpl<$Res>;
  $Res call({int maxPage});
}

/// @nodoc
class _$PaginationLinkHeaderCopyWithImpl<$Res>
    implements $PaginationLinkHeaderCopyWith<$Res> {
  _$PaginationLinkHeaderCopyWithImpl(this._value, this._then);

  final PaginationLinkHeader _value;
  // ignore: unused_field
  final $Res Function(PaginationLinkHeader) _then;

  @override
  $Res call({
    Object? maxPage = freezed,
  }) {
    return _then(_value.copyWith(
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PaginationLinkHeaderCopyWith<$Res>
    implements $PaginationLinkHeaderCopyWith<$Res> {
  factory _$PaginationLinkHeaderCopyWith(_PaginationLinkHeader value,
          $Res Function(_PaginationLinkHeader) then) =
      __$PaginationLinkHeaderCopyWithImpl<$Res>;
  @override
  $Res call({int maxPage});
}

/// @nodoc
class __$PaginationLinkHeaderCopyWithImpl<$Res>
    extends _$PaginationLinkHeaderCopyWithImpl<$Res>
    implements _$PaginationLinkHeaderCopyWith<$Res> {
  __$PaginationLinkHeaderCopyWithImpl(
      _PaginationLinkHeader _value, $Res Function(_PaginationLinkHeader) _then)
      : super(_value, (v) => _then(v as _PaginationLinkHeader));

  @override
  _PaginationLinkHeader get _value => super._value as _PaginationLinkHeader;

  @override
  $Res call({
    Object? maxPage = freezed,
  }) {
    return _then(_PaginationLinkHeader(
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationLinkHeader extends _PaginationLinkHeader {
  const _$_PaginationLinkHeader({required this.maxPage}) : super._();

  factory _$_PaginationLinkHeader.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationLinkHeaderFromJson(json);

  @override
  final int maxPage;

  @override
  String toString() {
    return 'PaginationLinkHeader(maxPage: $maxPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationLinkHeader &&
            (identical(other.maxPage, maxPage) ||
                const DeepCollectionEquality().equals(other.maxPage, maxPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(maxPage);

  @JsonKey(ignore: true)
  @override
  _$PaginationLinkHeaderCopyWith<_PaginationLinkHeader> get copyWith =>
      __$PaginationLinkHeaderCopyWithImpl<_PaginationLinkHeader>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationLinkHeaderToJson(this);
  }
}

abstract class _PaginationLinkHeader extends PaginationLinkHeader {
  const factory _PaginationLinkHeader({required int maxPage}) =
      _$_PaginationLinkHeader;
  const _PaginationLinkHeader._() : super._();

  factory _PaginationLinkHeader.fromJson(Map<String, dynamic> json) =
      _$_PaginationLinkHeader.fromJson;

  @override
  int get maxPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationLinkHeaderCopyWith<_PaginationLinkHeader> get copyWith =>
      throw _privateConstructorUsedError;
}
