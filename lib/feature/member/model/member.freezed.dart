// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  bool get privacyAgreed => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {String name,
      String nickname,
      String email,
      String picture,
      bool privacyAgreed,
      double score});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nickname = null,
    Object? email = null,
    Object? picture = null,
    Object? privacyAgreed = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      privacyAgreed: null == privacyAgreed
          ? _value.privacyAgreed
          : privacyAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String nickname,
      String email,
      String picture,
      bool privacyAgreed,
      double score});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nickname = null,
    Object? email = null,
    Object? picture = null,
    Object? privacyAgreed = null,
    Object? score = null,
  }) {
    return _then(_$MemberImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      privacyAgreed: null == privacyAgreed
          ? _value.privacyAgreed
          : privacyAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl implements _Member {
  const _$MemberImpl(
      {required this.name,
      required this.nickname,
      required this.email,
      required this.picture,
      required this.privacyAgreed,
      required this.score});

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  final String name;
  @override
  final String nickname;
  @override
  final String email;
  @override
  final String picture;
  @override
  final bool privacyAgreed;
  @override
  final double score;

  @override
  String toString() {
    return 'Member(name: $name, nickname: $nickname, email: $email, picture: $picture, privacyAgreed: $privacyAgreed, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.privacyAgreed, privacyAgreed) ||
                other.privacyAgreed == privacyAgreed) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, nickname, email, picture, privacyAgreed, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class _Member implements Member {
  const factory _Member(
      {required final String name,
      required final String nickname,
      required final String email,
      required final String picture,
      required final bool privacyAgreed,
      required final double score}) = _$MemberImpl;

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  String get name;
  @override
  String get nickname;
  @override
  String get email;
  @override
  String get picture;
  @override
  bool get privacyAgreed;
  @override
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
