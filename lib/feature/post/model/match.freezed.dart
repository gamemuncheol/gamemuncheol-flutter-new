// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _MatchHistory.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get gameId => throw _privateConstructorUsedError;
  String get gameCreation => throw _privateConstructorUsedError;
  int get gameDuration => throw _privateConstructorUsedError;
  String get gameMode => throw _privateConstructorUsedError;
  List<MatchUser> get matchUsers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
  @useResult
  $Res call(
      {String gameId,
      String gameCreation,
      int gameDuration,
      String gameMode,
      List<MatchUser> matchUsers});
}

/// @nodoc
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? gameCreation = null,
    Object? gameDuration = null,
    Object? gameMode = null,
    Object? matchUsers = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      gameCreation: null == gameCreation
          ? _value.gameCreation
          : gameCreation // ignore: cast_nullable_to_non_nullable
              as String,
      gameDuration: null == gameDuration
          ? _value.gameDuration
          : gameDuration // ignore: cast_nullable_to_non_nullable
              as int,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
      matchUsers: null == matchUsers
          ? _value.matchUsers
          : matchUsers // ignore: cast_nullable_to_non_nullable
              as List<MatchUser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchHistoryImplCopyWith<$Res>
    implements $MatchCopyWith<$Res> {
  factory _$$MatchHistoryImplCopyWith(
          _$MatchHistoryImpl value, $Res Function(_$MatchHistoryImpl) then) =
      __$$MatchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gameId,
      String gameCreation,
      int gameDuration,
      String gameMode,
      List<MatchUser> matchUsers});
}

/// @nodoc
class __$$MatchHistoryImplCopyWithImpl<$Res>
    extends _$MatchCopyWithImpl<$Res, _$MatchHistoryImpl>
    implements _$$MatchHistoryImplCopyWith<$Res> {
  __$$MatchHistoryImplCopyWithImpl(
      _$MatchHistoryImpl _value, $Res Function(_$MatchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? gameCreation = null,
    Object? gameDuration = null,
    Object? gameMode = null,
    Object? matchUsers = null,
  }) {
    return _then(_$MatchHistoryImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      gameCreation: null == gameCreation
          ? _value.gameCreation
          : gameCreation // ignore: cast_nullable_to_non_nullable
              as String,
      gameDuration: null == gameDuration
          ? _value.gameDuration
          : gameDuration // ignore: cast_nullable_to_non_nullable
              as int,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
      matchUsers: null == matchUsers
          ? _value._matchUsers
          : matchUsers // ignore: cast_nullable_to_non_nullable
              as List<MatchUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchHistoryImpl implements _MatchHistory {
  const _$MatchHistoryImpl(
      {required this.gameId,
      required this.gameCreation,
      required this.gameDuration,
      required this.gameMode,
      required final List<MatchUser> matchUsers})
      : _matchUsers = matchUsers;

  factory _$MatchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchHistoryImplFromJson(json);

  @override
  final String gameId;
  @override
  final String gameCreation;
  @override
  final int gameDuration;
  @override
  final String gameMode;
  final List<MatchUser> _matchUsers;
  @override
  List<MatchUser> get matchUsers {
    if (_matchUsers is EqualUnmodifiableListView) return _matchUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchUsers);
  }

  @override
  String toString() {
    return 'Match(gameId: $gameId, gameCreation: $gameCreation, gameDuration: $gameDuration, gameMode: $gameMode, matchUsers: $matchUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchHistoryImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.gameCreation, gameCreation) ||
                other.gameCreation == gameCreation) &&
            (identical(other.gameDuration, gameDuration) ||
                other.gameDuration == gameDuration) &&
            (identical(other.gameMode, gameMode) ||
                other.gameMode == gameMode) &&
            const DeepCollectionEquality()
                .equals(other._matchUsers, _matchUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameId, gameCreation,
      gameDuration, gameMode, const DeepCollectionEquality().hash(_matchUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchHistoryImplCopyWith<_$MatchHistoryImpl> get copyWith =>
      __$$MatchHistoryImplCopyWithImpl<_$MatchHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchHistoryImplToJson(
      this,
    );
  }
}

abstract class _MatchHistory implements Match {
  const factory _MatchHistory(
      {required final String gameId,
      required final String gameCreation,
      required final int gameDuration,
      required final String gameMode,
      required final List<MatchUser> matchUsers}) = _$MatchHistoryImpl;

  factory _MatchHistory.fromJson(Map<String, dynamic> json) =
      _$MatchHistoryImpl.fromJson;

  @override
  String get gameId;
  @override
  String get gameCreation;
  @override
  int get gameDuration;
  @override
  String get gameMode;
  @override
  List<MatchUser> get matchUsers;
  @override
  @JsonKey(ignore: true)
  _$$MatchHistoryImplCopyWith<_$MatchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
