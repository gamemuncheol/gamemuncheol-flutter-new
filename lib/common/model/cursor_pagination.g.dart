// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CursorPaginationImpl<T> _$$CursorPaginationImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$CursorPaginationImpl<T>(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      currentElements: (json['currentElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$CursorPaginationImplToJson<T>(
  _$CursorPaginationImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'currentElements': instance.currentElements,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'data': instance.data.map(toJsonT).toList(),
    };
