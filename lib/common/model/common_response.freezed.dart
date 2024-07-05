// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonResponse<T> _$CommonResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _CommonResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$CommonResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  CommonResponseStatus get status => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonResponseCopyWith<T, CommonResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonResponseCopyWith<T, $Res> {
  factory $CommonResponseCopyWith(
          CommonResponse<T> value, $Res Function(CommonResponse<T>) then) =
      _$CommonResponseCopyWithImpl<T, $Res, CommonResponse<T>>;
  @useResult
  $Res call({bool success, CommonResponseStatus status, T? data});

  $CommonResponseStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CommonResponseCopyWithImpl<T, $Res, $Val extends CommonResponse<T>>
    implements $CommonResponseCopyWith<T, $Res> {
  _$CommonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonResponseStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommonResponseStatusCopyWith<$Res> get status {
    return $CommonResponseStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommonResponseImplCopyWith<T, $Res>
    implements $CommonResponseCopyWith<T, $Res> {
  factory _$$CommonResponseImplCopyWith(_$CommonResponseImpl<T> value,
          $Res Function(_$CommonResponseImpl<T>) then) =
      __$$CommonResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool success, CommonResponseStatus status, T? data});

  @override
  $CommonResponseStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$CommonResponseImplCopyWithImpl<T, $Res>
    extends _$CommonResponseCopyWithImpl<T, $Res, _$CommonResponseImpl<T>>
    implements _$$CommonResponseImplCopyWith<T, $Res> {
  __$$CommonResponseImplCopyWithImpl(_$CommonResponseImpl<T> _value,
      $Res Function(_$CommonResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? data = freezed,
  }) {
    return _then(_$CommonResponseImpl<T>(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonResponseStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$CommonResponseImpl<T> implements _CommonResponse<T> {
  _$CommonResponseImpl(
      {required this.success, required this.status, this.data});

  factory _$CommonResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$CommonResponseImplFromJson(json, fromJsonT);

  @override
  final bool success;
  @override
  final CommonResponseStatus status;
  @override
  final T? data;

  @override
  String toString() {
    return 'CommonResponse<$T>(success: $success, status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, status, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonResponseImplCopyWith<T, _$CommonResponseImpl<T>> get copyWith =>
      __$$CommonResponseImplCopyWithImpl<T, _$CommonResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$CommonResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _CommonResponse<T> implements CommonResponse<T> {
  factory _CommonResponse(
      {required final bool success,
      required final CommonResponseStatus status,
      final T? data}) = _$CommonResponseImpl<T>;

  factory _CommonResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$CommonResponseImpl<T>.fromJson;

  @override
  bool get success;
  @override
  CommonResponseStatus get status;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$CommonResponseImplCopyWith<T, _$CommonResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonResponseStatus _$CommonResponseStatusFromJson(Map<String, dynamic> json) {
  return _CommonResponseStatus.fromJson(json);
}

/// @nodoc
mixin _$CommonResponseStatus {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonResponseStatusCopyWith<CommonResponseStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonResponseStatusCopyWith<$Res> {
  factory $CommonResponseStatusCopyWith(CommonResponseStatus value,
          $Res Function(CommonResponseStatus) then) =
      _$CommonResponseStatusCopyWithImpl<$Res, CommonResponseStatus>;
  @useResult
  $Res call({int statusCode, String message});
}

/// @nodoc
class _$CommonResponseStatusCopyWithImpl<$Res,
        $Val extends CommonResponseStatus>
    implements $CommonResponseStatusCopyWith<$Res> {
  _$CommonResponseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonResponseStatusImplCopyWith<$Res>
    implements $CommonResponseStatusCopyWith<$Res> {
  factory _$$CommonResponseStatusImplCopyWith(_$CommonResponseStatusImpl value,
          $Res Function(_$CommonResponseStatusImpl) then) =
      __$$CommonResponseStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, String message});
}

/// @nodoc
class __$$CommonResponseStatusImplCopyWithImpl<$Res>
    extends _$CommonResponseStatusCopyWithImpl<$Res, _$CommonResponseStatusImpl>
    implements _$$CommonResponseStatusImplCopyWith<$Res> {
  __$$CommonResponseStatusImplCopyWithImpl(_$CommonResponseStatusImpl _value,
      $Res Function(_$CommonResponseStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_$CommonResponseStatusImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonResponseStatusImpl implements _CommonResponseStatus {
  _$CommonResponseStatusImpl({required this.statusCode, required this.message});

  factory _$CommonResponseStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonResponseStatusImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'CommonResponseStatus(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonResponseStatusImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonResponseStatusImplCopyWith<_$CommonResponseStatusImpl>
      get copyWith =>
          __$$CommonResponseStatusImplCopyWithImpl<_$CommonResponseStatusImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonResponseStatusImplToJson(
      this,
    );
  }
}

abstract class _CommonResponseStatus implements CommonResponseStatus {
  factory _CommonResponseStatus(
      {required final int statusCode,
      required final String message}) = _$CommonResponseStatusImpl;

  factory _CommonResponseStatus.fromJson(Map<String, dynamic> json) =
      _$CommonResponseStatusImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CommonResponseStatusImplCopyWith<_$CommonResponseStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
