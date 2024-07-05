// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpForm _$SignUpFormFromJson(Map<String, dynamic> json) {
  return _SignUpForm.fromJson(json);
}

/// @nodoc
mixin _$SignUpForm {
  String get temporaryKey => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get privacyAgree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpFormCopyWith<SignUpForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormCopyWith<$Res> {
  factory $SignUpFormCopyWith(
          SignUpForm value, $Res Function(SignUpForm) then) =
      _$SignUpFormCopyWithImpl<$Res, SignUpForm>;
  @useResult
  $Res call({String temporaryKey, String nickname, bool privacyAgree});
}

/// @nodoc
class _$SignUpFormCopyWithImpl<$Res, $Val extends SignUpForm>
    implements $SignUpFormCopyWith<$Res> {
  _$SignUpFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temporaryKey = null,
    Object? nickname = null,
    Object? privacyAgree = null,
  }) {
    return _then(_value.copyWith(
      temporaryKey: null == temporaryKey
          ? _value.temporaryKey
          : temporaryKey // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      privacyAgree: null == privacyAgree
          ? _value.privacyAgree
          : privacyAgree // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpFormImplCopyWith<$Res>
    implements $SignUpFormCopyWith<$Res> {
  factory _$$SignUpFormImplCopyWith(
          _$SignUpFormImpl value, $Res Function(_$SignUpFormImpl) then) =
      __$$SignUpFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String temporaryKey, String nickname, bool privacyAgree});
}

/// @nodoc
class __$$SignUpFormImplCopyWithImpl<$Res>
    extends _$SignUpFormCopyWithImpl<$Res, _$SignUpFormImpl>
    implements _$$SignUpFormImplCopyWith<$Res> {
  __$$SignUpFormImplCopyWithImpl(
      _$SignUpFormImpl _value, $Res Function(_$SignUpFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temporaryKey = null,
    Object? nickname = null,
    Object? privacyAgree = null,
  }) {
    return _then(_$SignUpFormImpl(
      temporaryKey: null == temporaryKey
          ? _value.temporaryKey
          : temporaryKey // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      privacyAgree: null == privacyAgree
          ? _value.privacyAgree
          : privacyAgree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpFormImpl implements _SignUpForm {
  _$SignUpFormImpl(
      {required this.temporaryKey,
      required this.nickname,
      required this.privacyAgree});

  factory _$SignUpFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpFormImplFromJson(json);

  @override
  final String temporaryKey;
  @override
  final String nickname;
  @override
  final bool privacyAgree;

  @override
  String toString() {
    return 'SignUpForm(temporaryKey: $temporaryKey, nickname: $nickname, privacyAgree: $privacyAgree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpFormImpl &&
            (identical(other.temporaryKey, temporaryKey) ||
                other.temporaryKey == temporaryKey) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.privacyAgree, privacyAgree) ||
                other.privacyAgree == privacyAgree));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temporaryKey, nickname, privacyAgree);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpFormImplCopyWith<_$SignUpFormImpl> get copyWith =>
      __$$SignUpFormImplCopyWithImpl<_$SignUpFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpFormImplToJson(
      this,
    );
  }
}

abstract class _SignUpForm implements SignUpForm {
  factory _SignUpForm(
      {required final String temporaryKey,
      required final String nickname,
      required final bool privacyAgree}) = _$SignUpFormImpl;

  factory _SignUpForm.fromJson(Map<String, dynamic> json) =
      _$SignUpFormImpl.fromJson;

  @override
  String get temporaryKey;
  @override
  String get nickname;
  @override
  bool get privacyAgree;
  @override
  @JsonKey(ignore: true)
  _$$SignUpFormImplCopyWith<_$SignUpFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
