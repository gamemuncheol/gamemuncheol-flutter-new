// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: (json['id'] as num).toInt(),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      videoUrl: json['videoUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      timesAgo: json['timesAgo'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      voteRatio: (json['voteRatio'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member': instance.member,
      'videoUrl': instance.videoUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'content': instance.content,
      'timesAgo': instance.timesAgo,
      'viewCount': instance.viewCount,
      'voteRatio': instance.voteRatio,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      author: Member.fromJson(json['author'] as Map<String, dynamic>),
      content: json['content'] as String,
      timesAgo: json['timesAgo'] as String,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'timesAgo': instance.timesAgo,
    };
