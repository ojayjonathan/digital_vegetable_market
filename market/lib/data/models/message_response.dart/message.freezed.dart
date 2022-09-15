// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) {
  return _MessageResponse.fromJson(json);
}

/// @nodoc
mixin _$MessageResponse {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: {})
  Map<dynamic, dynamic> get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageResponseCopyWith<MessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageResponseCopyWith<$Res> {
  factory $MessageResponseCopyWith(
          MessageResponse value, $Res Function(MessageResponse) then) =
      _$MessageResponseCopyWithImpl<$Res>;
  $Res call(
      {String message,
      @JsonKey(defaultValue: {}) Map<dynamic, dynamic> details});
}

/// @nodoc
class _$MessageResponseCopyWithImpl<$Res>
    implements $MessageResponseCopyWith<$Res> {
  _$MessageResponseCopyWithImpl(this._value, this._then);

  final MessageResponse _value;
  // ignore: unused_field
  final $Res Function(MessageResponse) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_MessageResponseCopyWith<$Res>
    implements $MessageResponseCopyWith<$Res> {
  factory _$$_MessageResponseCopyWith(
          _$_MessageResponse value, $Res Function(_$_MessageResponse) then) =
      __$$_MessageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      @JsonKey(defaultValue: {}) Map<dynamic, dynamic> details});
}

/// @nodoc
class __$$_MessageResponseCopyWithImpl<$Res>
    extends _$MessageResponseCopyWithImpl<$Res>
    implements _$$_MessageResponseCopyWith<$Res> {
  __$$_MessageResponseCopyWithImpl(
      _$_MessageResponse _value, $Res Function(_$_MessageResponse) _then)
      : super(_value, (v) => _then(v as _$_MessageResponse));

  @override
  _$_MessageResponse get _value => super._value as _$_MessageResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_MessageResponse(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageResponse implements _MessageResponse {
  _$_MessageResponse(
      {required this.message,
      @JsonKey(defaultValue: {}) required final Map<dynamic, dynamic> details})
      : _details = details;

  factory _$_MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MessageResponseFromJson(json);

  @override
  final String message;
  final Map<dynamic, dynamic> _details;
  @override
  @JsonKey(defaultValue: {})
  Map<dynamic, dynamic> get details {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  @override
  String toString() {
    return 'MessageResponse(message: $message, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageResponse &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  _$$_MessageResponseCopyWith<_$_MessageResponse> get copyWith =>
      __$$_MessageResponseCopyWithImpl<_$_MessageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageResponseToJson(
      this,
    );
  }
}

abstract class _MessageResponse implements MessageResponse {
  factory _MessageResponse(
      {required final String message,
      @JsonKey(defaultValue: {})
          required final Map<dynamic, dynamic> details}) = _$_MessageResponse;

  factory _MessageResponse.fromJson(Map<String, dynamic> json) =
      _$_MessageResponse.fromJson;

  @override
  String get message;
  @override
  @JsonKey(defaultValue: {})
  Map<dynamic, dynamic> get details;
  @override
  @JsonKey(ignore: true)
  _$$_MessageResponseCopyWith<_$_MessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
