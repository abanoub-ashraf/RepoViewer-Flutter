// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fresh_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FreshDataEntityTearOff {
  const _$FreshDataEntityTearOff();

  _FreshDataEntity<T> call<T>(
      {required T entity, required bool isFresh, bool? isNextPageAvailable}) {
    return _FreshDataEntity<T>(
      entity: entity,
      isFresh: isFresh,
      isNextPageAvailable: isNextPageAvailable,
    );
  }
}

/// @nodoc
const $FreshDataEntity = _$FreshDataEntityTearOff();

/// @nodoc
mixin _$FreshDataEntity<T> {
  ///
  /// the type of entity this class will have
  ///
  T get entity => throw _privateConstructorUsedError;

  ///
  /// to tell us whether to display a message in the ui saying the data
  /// is outdated or not
  ///
  bool get isFresh => throw _privateConstructorUsedError;

  ///
  /// instead of sending the max page number to the application layer
  /// we will use this bool instead, if it's true then we will increase the page number
  /// in the state notifier of the application layer and get the next page next time
  /// it's needed, if not available then we will stop getting the pages altogether
  ///
  bool? get isNextPageAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreshDataEntityCopyWith<T, FreshDataEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreshDataEntityCopyWith<T, $Res> {
  factory $FreshDataEntityCopyWith(
          FreshDataEntity<T> value, $Res Function(FreshDataEntity<T>) then) =
      _$FreshDataEntityCopyWithImpl<T, $Res>;
  $Res call({T entity, bool isFresh, bool? isNextPageAvailable});
}

/// @nodoc
class _$FreshDataEntityCopyWithImpl<T, $Res>
    implements $FreshDataEntityCopyWith<T, $Res> {
  _$FreshDataEntityCopyWithImpl(this._value, this._then);

  final FreshDataEntity<T> _value;
  // ignore: unused_field
  final $Res Function(FreshDataEntity<T>) _then;

  @override
  $Res call({
    Object? entity = freezed,
    Object? isFresh = freezed,
    Object? isNextPageAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
      isFresh: isFresh == freezed
          ? _value.isFresh
          : isFresh // ignore: cast_nullable_to_non_nullable
              as bool,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FreshDataEntityCopyWith<T, $Res>
    implements $FreshDataEntityCopyWith<T, $Res> {
  factory _$FreshDataEntityCopyWith(
          _FreshDataEntity<T> value, $Res Function(_FreshDataEntity<T>) then) =
      __$FreshDataEntityCopyWithImpl<T, $Res>;
  @override
  $Res call({T entity, bool isFresh, bool? isNextPageAvailable});
}

/// @nodoc
class __$FreshDataEntityCopyWithImpl<T, $Res>
    extends _$FreshDataEntityCopyWithImpl<T, $Res>
    implements _$FreshDataEntityCopyWith<T, $Res> {
  __$FreshDataEntityCopyWithImpl(
      _FreshDataEntity<T> _value, $Res Function(_FreshDataEntity<T>) _then)
      : super(_value, (v) => _then(v as _FreshDataEntity<T>));

  @override
  _FreshDataEntity<T> get _value => super._value as _FreshDataEntity<T>;

  @override
  $Res call({
    Object? entity = freezed,
    Object? isFresh = freezed,
    Object? isNextPageAvailable = freezed,
  }) {
    return _then(_FreshDataEntity<T>(
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
      isFresh: isFresh == freezed
          ? _value.isFresh
          : isFresh // ignore: cast_nullable_to_non_nullable
              as bool,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FreshDataEntity<T> extends _FreshDataEntity<T> {
  const _$_FreshDataEntity(
      {required this.entity, required this.isFresh, this.isNextPageAvailable})
      : super._();

  @override

  ///
  /// the type of entity this class will have
  ///
  final T entity;
  @override

  ///
  /// to tell us whether to display a message in the ui saying the data
  /// is outdated or not
  ///
  final bool isFresh;
  @override

  ///
  /// instead of sending the max page number to the application layer
  /// we will use this bool instead, if it's true then we will increase the page number
  /// in the state notifier of the application layer and get the next page next time
  /// it's needed, if not available then we will stop getting the pages altogether
  ///
  final bool? isNextPageAvailable;

  @override
  String toString() {
    return 'FreshDataEntity<$T>(entity: $entity, isFresh: $isFresh, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FreshDataEntity<T> &&
            (identical(other.entity, entity) ||
                const DeepCollectionEquality().equals(other.entity, entity)) &&
            (identical(other.isFresh, isFresh) ||
                const DeepCollectionEquality()
                    .equals(other.isFresh, isFresh)) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.isNextPageAvailable, isNextPageAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(entity) ^
      const DeepCollectionEquality().hash(isFresh) ^
      const DeepCollectionEquality().hash(isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  _$FreshDataEntityCopyWith<T, _FreshDataEntity<T>> get copyWith =>
      __$FreshDataEntityCopyWithImpl<T, _FreshDataEntity<T>>(this, _$identity);
}

abstract class _FreshDataEntity<T> extends FreshDataEntity<T> {
  const factory _FreshDataEntity(
      {required T entity,
      required bool isFresh,
      bool? isNextPageAvailable}) = _$_FreshDataEntity<T>;
  const _FreshDataEntity._() : super._();

  @override

  ///
  /// the type of entity this class will have
  ///
  T get entity => throw _privateConstructorUsedError;
  @override

  ///
  /// to tell us whether to display a message in the ui saying the data
  /// is outdated or not
  ///
  bool get isFresh => throw _privateConstructorUsedError;
  @override

  ///
  /// instead of sending the max page number to the application layer
  /// we will use this bool instead, if it's true then we will increase the page number
  /// in the state notifier of the application layer and get the next page next time
  /// it's needed, if not available then we will stop getting the pages altogether
  ///
  bool? get isNextPageAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FreshDataEntityCopyWith<T, _FreshDataEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
