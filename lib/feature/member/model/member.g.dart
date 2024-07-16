// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      picture: json['picture'] as String,
      privacyAgreed: json['privacyAgreed'] as bool,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'picture': instance.picture,
      'privacyAgreed': instance.privacyAgreed,
      'score': instance.score,
    };
