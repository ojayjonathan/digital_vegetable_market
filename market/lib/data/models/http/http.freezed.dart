// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'http.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HttpResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorObject error) onError,
    required TResult Function(T data) onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ErrorObject error)? onError,
    TResult Function(T data)? onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorObject error)? onError,
    TResult Function(T data)? onSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorResponse<T> value) onError,
    required TResult Function(SuccessResponse<T> value) onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ErrorResponse<T> value)? onError,
    TResult Function(SuccessResponse<T> value)? onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorResponse<T> value)? onError,
    TResult Function(SuccessResponse<T> value)? onSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResultCopyWith<T, $Res> {
  factory $HttpResultCopyWith(
          HttpResult<T> value, $Res Function(HttpResult<T>) then) =
      _$HttpResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$HttpResultCopyWithImpl<T, $Res>
    implements $HttpResultCopyWith<T, $Res> {
  _$HttpResultCopyWithImpl(this._value, this._then);

  final HttpResult<T> _value;
  // ignore: unused_field
  final $Res Function(HttpResult<T>) _then;
}

/// @nodoc
abstract class _$$ErrorResponseCopyWith<T, $Res> {
  factory _$$ErrorResponseCopyWith(
          _$ErrorResponse<T> value, $Res Function(_$ErrorResponse<T>) then) =
      __$$ErrorResponseCopyWithImpl<T, $Res>;
  $Res call({ErrorObject error});
}

/// @nodoc
class __$$ErrorResponseCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements _$$ErrorResponseCopyWith<T, $Res> {
  __$$ErrorResponseCopyWithImpl(
      _$ErrorResponse<T> _value, $Res Function(_$ErrorResponse<T>) _then)
      : super(_value, (v) => _then(v as _$ErrorResponse<T>));

  @override
  _$ErrorResponse<T> get _value => super._value as _$ErrorResponse<T>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorResponse<T>(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorObject,
    ));
  }
}

/// @nodoc

class _$ErrorResponse<T> implements ErrorResponse<T> {
  const _$ErrorResponse({required this.error});

  @override
  final ErrorObject error;

  @override
  String toString() {
    return 'HttpResult<$T>.onError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponse<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ErrorResponseCopyWith<T, _$ErrorResponse<T>> get copyWith =>
      __$$ErrorResponseCopyWithImpl<T, _$ErrorResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorObject error) onError,
    required TResult Function(T data) onSuccess,
  }) {
    return onError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ErrorObject error)? onError,
    TResult Function(T data)? onSuccess,
  }) {
    return onError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorObject error)? onError,
    TResult Function(T data)? onSuccess,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorResponse<T> value) onError,
    required TResult Function(SuccessResponse<T> value) onSuccess,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ErrorResponse<T> value)? onError,
    TResult Function(SuccessResponse<T> value)? onSuccess,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorResponse<T> value)? onError,
    TResult Function(SuccessResponse<T> value)? onSuccess,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class ErrorResponse<T> implements HttpResult<T> {
  const factory ErrorResponse({required final ErrorObject error}) =
      _$ErrorResponse<T>;

  ErrorObject get error;
  @JsonKey(ignore: true)
  _$$ErrorResponseCopyWith<T, _$ErrorResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessResponseCopyWith<T, $Res> {
  factory _$$SuccessResponseCopyWith(_$SuccessResponse<T> value,
          $Res Function(_$SuccessResponse<T>) then) =
      __$$SuccessResponseCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$SuccessResponseCopyWithImpl<T, $Res>
    extends _$HttpResultCopyWithImpl<T, $Res>
    implements _$$SuccessResponseCopyWith<T, $Res> {
  __$$SuccessResponseCopyWithImpl(
      _$SuccessResponse<T> _value, $Res Function(_$SuccessResponse<T>) _then)
      : super(_value, (v) => _then(v as _$SuccessResponse<T>));

  @override
  _$SuccessResponse<T> get _value => super._value as _$SuccessResponse<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessResponse<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessResponse<T> implements SuccessResponse<T> {
  const _$SuccessResponse({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'HttpResult<$T>.onSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$SuccessResponseCopyWith<T, _$SuccessResponse<T>> get copyWith =>
      __$$SuccessResponseCopyWithImpl<T, _$SuccessResponse<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorObject error) onError,
    required TResult Function(T data) onSuccess,
  }) {
    return onSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ErrorObject error)? onError,
    TResult Function(T data)? onSuccess,
  }) {
    return onSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorObject error)? onError,
    TResult Function(T data)? onSuccess,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorResponse<T> value) onError,
    required TResult Function(SuccessResponse<T> value) onSuccess,
  }) {
    return onSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ErrorResponse<T> value)? onError,
    TResult Function(SuccessResponse<T> value)? onSuccess,
  }) {
    return onSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorResponse<T> value)? onError,
    TResult Function(SuccessResponse<T> value)? onSuccess,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class SuccessResponse<T> implements HttpResult<T> {
  const factory SuccessResponse({required final T data}) = _$SuccessResponse<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SuccessResponseCopyWith<T, _$SuccessResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
