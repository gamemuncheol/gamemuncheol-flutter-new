// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchHistoryImpl _$$MatchHistoryImplFromJson(Map<String, dynamic> json) =>
    _$MatchHistoryImpl(
      gameId: json['gameId'] as String,
      gameCreation: json['gameCreation'] as String,
      gameDuration: (json['gameDuration'] as num).toInt(),
      gameMode: json['gameMode'] as String,
      matchUsers: (json['matchUsers'] as List<dynamic>)
          .map((e) => MatchUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchHistoryImplToJson(_$MatchHistoryImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'gameCreation': instance.gameCreation,
      'gameDuration': instance.gameDuration,
      'gameMode': instance.gameMode,
      'matchUsers': instance.matchUsers,
    };
