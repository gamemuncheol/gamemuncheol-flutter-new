// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullyAccessedTokenImpl _$$FullyAccessedTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$FullyAccessedTokenImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$FullyAccessedTokenImplToJson(
        _$FullyAccessedTokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_$TemporaryAccessedTokenImpl _$$TemporaryAccessedTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$TemporaryAccessedTokenImpl(
      temporaryUserKey: json['temporaryUserKey'] as String,
    );

Map<String, dynamic> _$$TemporaryAccessedTokenImplToJson(
        _$TemporaryAccessedTokenImpl instance) =>
    <String, dynamic>{
      'temporaryUserKey': instance.temporaryUserKey,
    };
