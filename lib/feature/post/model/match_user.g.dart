// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchUserImpl _$$MatchUserImplFromJson(Map<String, dynamic> json) =>
    _$MatchUserImpl(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      championName: json['championName'] as String,
      championThumbnail: json['championThumbnail'] as String,
      win: json['win'] as bool,
    );

Map<String, dynamic> _$$MatchUserImplToJson(_$MatchUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'championName': instance.championName,
      'championThumbnail': instance.championThumbnail,
      'win': instance.win,
    };
