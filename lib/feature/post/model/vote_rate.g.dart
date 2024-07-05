// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteOptionDetailImpl _$$VoteOptionDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$VoteOptionDetailImpl(
      matchUserId: (json['matchUserId'] as num).toInt(),
      nickname: json['nickname'] as String,
      championThumbnail: json['championThumbnail'] as String,
      voteOptionsId: (json['voteOptionsId'] as num).toInt(),
    );

Map<String, dynamic> _$$VoteOptionDetailImplToJson(
        _$VoteOptionDetailImpl instance) =>
    <String, dynamic>{
      'matchUserId': instance.matchUserId,
      'nickname': instance.nickname,
      'championThumbnail': instance.championThumbnail,
      'voteOptionsId': instance.voteOptionsId,
    };
