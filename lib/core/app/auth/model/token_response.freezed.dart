// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FullyAccessedToken token) fully,
    required TResult Function(TemporaryAccessedToken temp) tempo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FullyAccessedToken token)? fully,
    TResult? Function(TemporaryAccessedToken temp)? tempo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FullyAccessedToken token)? fully,
    TResult Function(TemporaryAccessedToken temp)? tempo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FullyAccessed value) fully,
    required TResult Function(TemporaryAccessed value) tempo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FullyAccessed value)? fully,
    TResult? Function(TemporaryAccessed value)? tempo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FullyAccessed value)? fully,
    TResult Function(TemporaryAccessed value)? tempo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FullyAccessedImplCopyWith<$Res> {
  factory _$$FullyAccessedImplCopyWith(
          _$FullyAccessedImpl value, $Res Function(_$FullyAccessedImpl) then) =
      __$$FullyAccessedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FullyAccessedToken token});

  $FullyAccessedTokenCopyWith<$Res> get token;
}

/// @nodoc
class __$$FullyAccessedImplCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$FullyAccessedImpl>
    implements _$$FullyAccessedImplCopyWith<$Res> {
  __$$FullyAccessedImplCopyWithImpl(
      _$FullyAccessedImpl _value, $Res Function(_$FullyAccessedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$FullyAccessedImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as FullyAccessedToken,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FullyAccessedTokenCopyWith<$Res> get token {
    return $FullyAccessedTokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value));
    });
  }
}

/// @nodoc

class _$FullyAccessedImpl implements FullyAccessed {
  const _$FullyAccessedImpl(this.token);

  @override
  final FullyAccessedToken token;

  @override
  String toString() {
    return 'TokenResponse.fully(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullyAccessedImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullyAccessedImplCopyWith<_$FullyAccessedImpl> get copyWith =>
      __$$FullyAccessedImplCopyWithImpl<_$FullyAccessedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FullyAccessedToken token) fully,
    required TResult Function(TemporaryAccessedToken temp) tempo,
  }) {
    return fully(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FullyAccessedToken token)? fully,
    TResult? Function(TemporaryAccessedToken temp)? tempo,
  }) {
    return fully?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FullyAccessedToken token)? fully,
    TResult Function(TemporaryAccessedToken temp)? tempo,
    required TResult orElse(),
  }) {
    if (fully != null) {
      return fully(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FullyAccessed value) fully,
    required TResult Function(TemporaryAccessed value) tempo,
  }) {
    return fully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FullyAccessed value)? fully,
    TResult? Function(TemporaryAccessed value)? tempo,
  }) {
    return fully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FullyAccessed value)? fully,
    TResult Function(TemporaryAccessed value)? tempo,
    required TResult orElse(),
  }) {
    if (fully != null) {
      return fully(this);
    }
    return orElse();
  }
}

abstract class FullyAccessed implements TokenResponse {
  const factory FullyAccessed(final FullyAccessedToken token) =
      _$FullyAccessedImpl;

  FullyAccessedToken get token;
  @JsonKey(ignore: true)
  _$$FullyAccessedImplCopyWith<_$FullyAccessedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TemporaryAccessedImplCopyWith<$Res> {
  factory _$$TemporaryAccessedImplCopyWith(_$TemporaryAccessedImpl value,
          $Res Function(_$TemporaryAccessedImpl) then) =
      __$$TemporaryAccessedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TemporaryAccessedToken temp});

  $TemporaryAccessedTokenCopyWith<$Res> get temp;
}

/// @nodoc
class __$$TemporaryAccessedImplCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$TemporaryAccessedImpl>
    implements _$$TemporaryAccessedImplCopyWith<$Res> {
  __$$TemporaryAccessedImplCopyWithImpl(_$TemporaryAccessedImpl _value,
      $Res Function(_$TemporaryAccessedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
  }) {
    return _then(_$TemporaryAccessedImpl(
      null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as TemporaryAccessedToken,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TemporaryAccessedTokenCopyWith<$Res> get temp {
    return $TemporaryAccessedTokenCopyWith<$Res>(_value.temp, (value) {
      return _then(_value.copyWith(temp: value));
    });
  }
}

/// @nodoc

class _$TemporaryAccessedImpl implements TemporaryAccessed {
  const _$TemporaryAccessedImpl(this.temp);

  @override
  final TemporaryAccessedToken temp;

  @override
  String toString() {
    return 'TokenResponse.tempo(temp: $temp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemporaryAccessedImpl &&
            (identical(other.temp, temp) || other.temp == temp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemporaryAccessedImplCopyWith<_$TemporaryAccessedImpl> get copyWith =>
      __$$TemporaryAccessedImplCopyWithImpl<_$TemporaryAccessedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FullyAccessedToken token) fully,
    required TResult Function(TemporaryAccessedToken temp) tempo,
  }) {
    return tempo(temp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FullyAccessedToken token)? fully,
    TResult? Function(TemporaryAccessedToken temp)? tempo,
  }) {
    return tempo?.call(temp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FullyAccessedToken token)? fully,
    TResult Function(TemporaryAccessedToken temp)? tempo,
    required TResult orElse(),
  }) {
    if (tempo != null) {
      return tempo(temp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FullyAccessed value) fully,
    required TResult Function(TemporaryAccessed value) tempo,
  }) {
    return tempo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FullyAccessed value)? fully,
    TResult? Function(TemporaryAccessed value)? tempo,
  }) {
    return tempo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FullyAccessed value)? fully,
    TResult Function(TemporaryAccessed value)? tempo,
    required TResult orElse(),
  }) {
    if (tempo != null) {
      return tempo(this);
    }
    return orElse();
  }
}

abstract class TemporaryAccessed implements TokenResponse {
  const factory TemporaryAccessed(final TemporaryAccessedToken temp) =
      _$TemporaryAccessedImpl;

  TemporaryAccessedToken get temp;
  @JsonKey(ignore: true)
  _$$TemporaryAccessedImplCopyWith<_$TemporaryAccessedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FullyAccessedToken _$FullyAccessedTokenFromJson(Map<String, dynamic> json) {
  return _FullyAccessedToken.fromJson(json);
}

/// @nodoc
mixin _$FullyAccessedToken {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullyAccessedTokenCopyWith<FullyAccessedToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullyAccessedTokenCopyWith<$Res> {
  factory $FullyAccessedTokenCopyWith(
          FullyAccessedToken value, $Res Function(FullyAccessedToken) then) =
      _$FullyAccessedTokenCopyWithImpl<$Res, FullyAccessedToken>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$FullyAccessedTokenCopyWithImpl<$Res, $Val extends FullyAccessedToken>
    implements $FullyAccessedTokenCopyWith<$Res> {
  _$FullyAccessedTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FullyAccessedTokenImplCopyWith<$Res>
    implements $FullyAccessedTokenCopyWith<$Res> {
  factory _$$FullyAccessedTokenImplCopyWith(_$FullyAccessedTokenImpl value,
          $Res Function(_$FullyAccessedTokenImpl) then) =
      __$$FullyAccessedTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$FullyAccessedTokenImplCopyWithImpl<$Res>
    extends _$FullyAccessedTokenCopyWithImpl<$Res, _$FullyAccessedTokenImpl>
    implements _$$FullyAccessedTokenImplCopyWith<$Res> {
  __$$FullyAccessedTokenImplCopyWithImpl(_$FullyAccessedTokenImpl _value,
      $Res Function(_$FullyAccessedTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$FullyAccessedTokenImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FullyAccessedTokenImpl implements _FullyAccessedToken {
  _$FullyAccessedTokenImpl(
      {required this.accessToken, required this.refreshToken});

  factory _$FullyAccessedTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$FullyAccessedTokenImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'FullyAccessedToken(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullyAccessedTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullyAccessedTokenImplCopyWith<_$FullyAccessedTokenImpl> get copyWith =>
      __$$FullyAccessedTokenImplCopyWithImpl<_$FullyAccessedTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FullyAccessedTokenImplToJson(
      this,
    );
  }
}

abstract class _FullyAccessedToken implements FullyAccessedToken {
  factory _FullyAccessedToken(
      {required final String accessToken,
      required final String refreshToken}) = _$FullyAccessedTokenImpl;

  factory _FullyAccessedToken.fromJson(Map<String, dynamic> json) =
      _$FullyAccessedTokenImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$FullyAccessedTokenImplCopyWith<_$FullyAccessedTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemporaryAccessedToken _$TemporaryAccessedTokenFromJson(
    Map<String, dynamic> json) {
  return _TemporaryAccessedToken.fromJson(json);
}

/// @nodoc
mixin _$TemporaryAccessedToken {
  String get temporaryUserKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemporaryAccessedTokenCopyWith<TemporaryAccessedToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemporaryAccessedTokenCopyWith<$Res> {
  factory $TemporaryAccessedTokenCopyWith(TemporaryAccessedToken value,
          $Res Function(TemporaryAccessedToken) then) =
      _$TemporaryAccessedTokenCopyWithImpl<$Res, TemporaryAccessedToken>;
  @useResult
  $Res call({String temporaryUserKey});
}

/// @nodoc
class _$TemporaryAccessedTokenCopyWithImpl<$Res,
        $Val extends TemporaryAccessedToken>
    implements $TemporaryAccessedTokenCopyWith<$Res> {
  _$TemporaryAccessedTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temporaryUserKey = null,
  }) {
    return _then(_value.copyWith(
      temporaryUserKey: null == temporaryUserKey
          ? _value.temporaryUserKey
          : temporaryUserKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemporaryAccessedTokenImplCopyWith<$Res>
    implements $TemporaryAccessedTokenCopyWith<$Res> {
  factory _$$TemporaryAccessedTokenImplCopyWith(
          _$TemporaryAccessedTokenImpl value,
          $Res Function(_$TemporaryAccessedTokenImpl) then) =
      __$$TemporaryAccessedTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String temporaryUserKey});
}

/// @nodoc
class __$$TemporaryAccessedTokenImplCopyWithImpl<$Res>
    extends _$TemporaryAccessedTokenCopyWithImpl<$Res,
        _$TemporaryAccessedTokenImpl>
    implements _$$TemporaryAccessedTokenImplCopyWith<$Res> {
  __$$TemporaryAccessedTokenImplCopyWithImpl(
      _$TemporaryAccessedTokenImpl _value,
      $Res Function(_$TemporaryAccessedTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temporaryUserKey = null,
  }) {
    return _then(_$TemporaryAccessedTokenImpl(
      temporaryUserKey: null == temporaryUserKey
          ? _value.temporaryUserKey
          : temporaryUserKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemporaryAccessedTokenImpl implements _TemporaryAccessedToken {
  _$TemporaryAccessedTokenImpl({required this.temporaryUserKey});

  factory _$TemporaryAccessedTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemporaryAccessedTokenImplFromJson(json);

  @override
  final String temporaryUserKey;

  @override
  String toString() {
    return 'TemporaryAccessedToken(temporaryUserKey: $temporaryUserKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemporaryAccessedTokenImpl &&
            (identical(other.temporaryUserKey, temporaryUserKey) ||
                other.temporaryUserKey == temporaryUserKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temporaryUserKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemporaryAccessedTokenImplCopyWith<_$TemporaryAccessedTokenImpl>
      get copyWith => __$$TemporaryAccessedTokenImplCopyWithImpl<
          _$TemporaryAccessedTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemporaryAccessedTokenImplToJson(
      this,
    );
  }
}

abstract class _TemporaryAccessedToken implements TemporaryAccessedToken {
  factory _TemporaryAccessedToken({required final String temporaryUserKey}) =
      _$TemporaryAccessedTokenImpl;

  factory _TemporaryAccessedToken.fromJson(Map<String, dynamic> json) =
      _$TemporaryAccessedTokenImpl.fromJson;

  @override
  String get temporaryUserKey;
  @override
  @JsonKey(ignore: true)
  _$$TemporaryAccessedTokenImplCopyWith<_$TemporaryAccessedTokenImpl>
      get copyWith => throw _privateConstructorUsedError;
}
