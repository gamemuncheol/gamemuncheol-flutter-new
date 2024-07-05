import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_pagination.freezed.dart';
part 'cursor_pagination.g.dart';

@Freezed(genericArgumentFactories: true)
class CursorPagination<T> with _$CursorPagination<T> {
  const factory CursorPagination({
   required int page,
    required int size,
    required int currentElements,
    required int totalPages,
    required int totalElements,
    required List<T> data,
  }) = _CursorPagination;

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson<T>(json, fromJsonT);
}



