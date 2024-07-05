// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_save_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostSaveFormImpl _$$PostSaveFormImplFromJson(Map<String, dynamic> json) =>
    _$PostSaveFormImpl(
      videoUrl: json['videoUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      matchUserIds: (json['matchUserIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostSaveFormImplToJson(_$PostSaveFormImpl instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'content': instance.content,
      'matchUserIds': instance.matchUserIds,
      'tags': instance.tags,
    };
