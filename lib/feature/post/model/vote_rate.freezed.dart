// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteOptionDetail _$VoteOptionDetailFromJson(Map<String, dynamic> json) {
  return _VoteOptionDetail.fromJson(json);
}

/// @nodoc
mixin _$VoteOptionDetail {
  int get matchUserId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get championThumbnail => throw _privateConstructorUsedError;
  int get voteOptionsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteOptionDetailCopyWith<VoteOptionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteOptionDetailCopyWith<$Res> {
  factory $VoteOptionDetailCopyWith(
          VoteOptionDetail value, $Res Function(VoteOptionDetail) then) =
      _$VoteOptionDetailCopyWithImpl<$Res, VoteOptionDetail>;
  @useResult
  $Res call(
      {int matchUserId,
      String nickname,
      String championThumbnail,
      int voteOptionsId});
}

/// @nodoc
class _$VoteOptionDetailCopyWithImpl<$Res, $Val extends VoteOptionDetail>
    implements $VoteOptionDetailCopyWith<$Res> {
  _$VoteOptionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchUserId = null,
    Object? nickname = null,
    Object? championThumbnail = null,
    Object? voteOptionsId = null,
  }) {
    return _then(_value.copyWith(
      matchUserId: null == matchUserId
          ? _value.matchUserId
          : matchUserId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      championThumbnail: null == championThumbnail
          ? _value.championThumbnail
          : championThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      voteOptionsId: null == voteOptionsId
          ? _value.voteOptionsId
          : voteOptionsId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteOptionDetailImplCopyWith<$Res>
    implements $VoteOptionDetailCopyWith<$Res> {
  factory _$$VoteOptionDetailImplCopyWith(_$VoteOptionDetailImpl value,
          $Res Function(_$VoteOptionDetailImpl) then) =
      __$$VoteOptionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int matchUserId,
      String nickname,
      String championThumbnail,
      int voteOptionsId});
}

/// @nodoc
class __$$VoteOptionDetailImplCopyWithImpl<$Res>
    extends _$VoteOptionDetailCopyWithImpl<$Res, _$VoteOptionDetailImpl>
    implements _$$VoteOptionDetailImplCopyWith<$Res> {
  __$$VoteOptionDetailImplCopyWithImpl(_$VoteOptionDetailImpl _value,
      $Res Function(_$VoteOptionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchUserId = null,
    Object? nickname = null,
    Object? championThumbnail = null,
    Object? voteOptionsId = null,
  }) {
    return _then(_$VoteOptionDetailImpl(
      matchUserId: null == matchUserId
          ? _value.matchUserId
          : matchUserId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      championThumbnail: null == championThumbnail
          ? _value.championThumbnail
          : championThumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      voteOptionsId: null == voteOptionsId
          ? _value.voteOptionsId
          : voteOptionsId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteOptionDetailImpl implements _VoteOptionDetail {
  const _$VoteOptionDetailImpl(
      {required this.matchUserId,
      required this.nickname,
      required this.championThumbnail,
      required this.voteOptionsId});

  factory _$VoteOptionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteOptionDetailImplFromJson(json);

  @override
  final int matchUserId;
  @override
  final String nickname;
  @override
  final String championThumbnail;
  @override
  final int voteOptionsId;

  @override
  String toString() {
    return 'VoteOptionDetail(matchUserId: $matchUserId, nickname: $nickname, championThumbnail: $championThumbnail, voteOptionsId: $voteOptionsId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteOptionDetailImpl &&
            (identical(other.matchUserId, matchUserId) ||
                other.matchUserId == matchUserId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.championThumbnail, championThumbnail) ||
                other.championThumbnail == championThumbnail) &&
            (identical(other.voteOptionsId, voteOptionsId) ||
                other.voteOptionsId == voteOptionsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, matchUserId, nickname, championThumbnail, voteOptionsId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteOptionDetailImplCopyWith<_$VoteOptionDetailImpl> get copyWith =>
      __$$VoteOptionDetailImplCopyWithImpl<_$VoteOptionDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteOptionDetailImplToJson(
      this,
    );
  }
}

abstract class _VoteOptionDetail implements VoteOptionDetail {
  const factory _VoteOptionDetail(
      {required final int matchUserId,
      required final String nickname,
      required final String championThumbnail,
      required final int voteOptionsId}) = _$VoteOptionDetailImpl;

  factory _VoteOptionDetail.fromJson(Map<String, dynamic> json) =
      _$VoteOptionDetailImpl.fromJson;

  @override
  int get matchUserId;
  @override
  String get nickname;
  @override
  String get championThumbnail;
  @override
  int get voteOptionsId;
  @override
  @JsonKey(ignore: true)
  _$$VoteOptionDetailImplCopyWith<_$VoteOptionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
