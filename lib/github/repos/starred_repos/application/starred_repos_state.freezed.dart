// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'starred_repos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StarredReposStateTearOff {
  const _$StarredReposStateTearOff();

  _Initial initial(FreshDataEntity<List<GithubRepoEntity>> starredRepos) {
    return _Initial(
      starredRepos,
    );
  }

  _LoadInProgress loadInProgress(
      FreshDataEntity<List<GithubRepoEntity>> starredRepos, int itemsPerPage) {
    return _LoadInProgress(
      starredRepos,
      itemsPerPage,
    );
  }

  _LoadSuccess loadSuccess(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      {required bool isNextPageAvailable}) {
    return _LoadSuccess(
      starredRepos,
      isNextPageAvailable: isNextPageAvailable,
    );
  }

  _LoadFailure loadFailure(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      GithubFailure failure) {
    return _LoadFailure(
      starredRepos,
      failure,
    );
  }
}

/// @nodoc
const $StarredReposState = _$StarredReposStateTearOff();

/// @nodoc
mixin _$StarredReposState {
  ///
  /// we don't need this here but it's good to have the starredRepos felid
  /// in all the cases of the state
  ///
  FreshDataEntity<List<GithubRepoEntity>> get starredRepos =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos)
        initial,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)
        loadInProgress,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StarredReposStateCopyWith<StarredReposState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarredReposStateCopyWith<$Res> {
  factory $StarredReposStateCopyWith(
          StarredReposState value, $Res Function(StarredReposState) then) =
      _$StarredReposStateCopyWithImpl<$Res>;
  $Res call({FreshDataEntity<List<GithubRepoEntity>> starredRepos});

  $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res> get starredRepos;
}

/// @nodoc
class _$StarredReposStateCopyWithImpl<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  _$StarredReposStateCopyWithImpl(this._value, this._then);

  final StarredReposState _value;
  // ignore: unused_field
  final $Res Function(StarredReposState) _then;

  @override
  $Res call({
    Object? starredRepos = freezed,
  }) {
    return _then(_value.copyWith(
      starredRepos: starredRepos == freezed
          ? _value.starredRepos
          : starredRepos // ignore: cast_nullable_to_non_nullable
              as FreshDataEntity<List<GithubRepoEntity>>,
    ));
  }

  @override
  $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res> get starredRepos {
    return $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res>(
        _value.starredRepos, (value) {
      return _then(_value.copyWith(starredRepos: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({FreshDataEntity<List<GithubRepoEntity>> starredRepos});

  @override
  $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res> get starredRepos;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$StarredReposStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? starredRepos = freezed,
  }) {
    return _then(_Initial(
      starredRepos == freezed
          ? _value.starredRepos
          : starredRepos // ignore: cast_nullable_to_non_nullable
              as FreshDataEntity<List<GithubRepoEntity>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.starredRepos) : super._();

  @override

  ///
  /// we don't need this here but it's good to have the starredRepos felid
  /// in all the cases of the state
  ///
  final FreshDataEntity<List<GithubRepoEntity>> starredRepos;

  @override
  String toString() {
    return 'StarredReposState.initial(starredRepos: $starredRepos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.starredRepos, starredRepos) ||
                const DeepCollectionEquality()
                    .equals(other.starredRepos, starredRepos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(starredRepos);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos)
        initial,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)
        loadInProgress,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)
        loadFailure,
  }) {
    return initial(starredRepos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
  }) {
    return initial?.call(starredRepos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(starredRepos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends StarredReposState {
  const factory _Initial(FreshDataEntity<List<GithubRepoEntity>> starredRepos) =
      _$_Initial;
  const _Initial._() : super._();

  @override

  ///
  /// we don't need this here but it's good to have the starredRepos felid
  /// in all the cases of the state
  ///
  FreshDataEntity<List<GithubRepoEntity>> get starredRepos =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call(
      {FreshDataEntity<List<GithubRepoEntity>> starredRepos, int itemsPerPage});

  @override
  $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res> get starredRepos;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;

  @override
  $Res call({
    Object? starredRepos = freezed,
    Object? itemsPerPage = freezed,
  }) {
    return _then(_LoadInProgress(
      starredRepos == freezed
          ? _value.starredRepos
          : starredRepos // ignore: cast_nullable_to_non_nullable
              as FreshDataEntity<List<GithubRepoEntity>>,
      itemsPerPage == freezed
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress(this.starredRepos, this.itemsPerPage) : super._();

  @override
  final FreshDataEntity<List<GithubRepoEntity>> starredRepos;
  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'StarredReposState.loadInProgress(starredRepos: $starredRepos, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadInProgress &&
            (identical(other.starredRepos, starredRepos) ||
                const DeepCollectionEquality()
                    .equals(other.starredRepos, starredRepos)) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                const DeepCollectionEquality()
                    .equals(other.itemsPerPage, itemsPerPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(starredRepos) ^
      const DeepCollectionEquality().hash(itemsPerPage);

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos)
        initial,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)
        loadInProgress,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)
        loadFailure,
  }) {
    return loadInProgress(starredRepos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(starredRepos, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(starredRepos, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends StarredReposState {
  const factory _LoadInProgress(
      FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      int itemsPerPage) = _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  FreshDataEntity<List<GithubRepoEntity>> get starredRepos =>
      throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      bool isNextPageAvailable});

  @override
  $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res> get starredRepos;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? starredRepos = freezed,
    Object? isNextPageAvailable = freezed,
  }) {
    return _then(_LoadSuccess(
      starredRepos == freezed
          ? _value.starredRepos
          : starredRepos // ignore: cast_nullable_to_non_nullable
              as FreshDataEntity<List<GithubRepoEntity>>,
      isNextPageAvailable: isNextPageAvailable == freezed
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess(this.starredRepos, {required this.isNextPageAvailable})
      : super._();

  @override
  final FreshDataEntity<List<GithubRepoEntity>> starredRepos;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'StarredReposState.loadSuccess(starredRepos: $starredRepos, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.starredRepos, starredRepos) ||
                const DeepCollectionEquality()
                    .equals(other.starredRepos, starredRepos)) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.isNextPageAvailable, isNextPageAvailable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(starredRepos) ^
      const DeepCollectionEquality().hash(isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos)
        initial,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)
        loadInProgress,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)
        loadFailure,
  }) {
    return loadSuccess(starredRepos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(starredRepos, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(starredRepos, isNextPageAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends StarredReposState {
  const factory _LoadSuccess(
      FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      {required bool isNextPageAvailable}) = _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  @override
  FreshDataEntity<List<GithubRepoEntity>> get starredRepos =>
      throw _privateConstructorUsedError;
  bool get isNextPageAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res>
    implements $StarredReposStateCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  @override
  $Res call(
      {FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      GithubFailure failure});

  @override
  $FreshDataEntityCopyWith<List<GithubRepoEntity>, $Res> get starredRepos;
  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$StarredReposStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? starredRepos = freezed,
    Object? failure = freezed,
  }) {
    return _then(_LoadFailure(
      starredRepos == freezed
          ? _value.starredRepos
          : starredRepos // ignore: cast_nullable_to_non_nullable
              as FreshDataEntity<List<GithubRepoEntity>>,
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
    ));
  }

  @override
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure extends _LoadFailure {
  const _$_LoadFailure(this.starredRepos, this.failure) : super._();

  @override
  final FreshDataEntity<List<GithubRepoEntity>> starredRepos;
  @override
  final GithubFailure failure;

  @override
  String toString() {
    return 'StarredReposState.loadFailure(starredRepos: $starredRepos, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.starredRepos, starredRepos) ||
                const DeepCollectionEquality()
                    .equals(other.starredRepos, starredRepos)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(starredRepos) ^
      const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos)
        initial,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)
        loadInProgress,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)
        loadFailure,
  }) {
    return loadFailure(starredRepos, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(starredRepos, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos)?
        initial,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            int itemsPerPage)?
        loadInProgress,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(FreshDataEntity<List<GithubRepoEntity>> starredRepos,
            GithubFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(starredRepos, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends StarredReposState {
  const factory _LoadFailure(
      FreshDataEntity<List<GithubRepoEntity>> starredRepos,
      GithubFailure failure) = _$_LoadFailure;
  const _LoadFailure._() : super._();

  @override
  FreshDataEntity<List<GithubRepoEntity>> get starredRepos =>
      throw _privateConstructorUsedError;
  GithubFailure get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
