import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_response.g.dart';
part 'common_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class CommonResponse<T> with _$CommonResponse<T> {
  factory CommonResponse({
    required bool success,
    required CommonResponseStatus status,
    T? data,
  }) = _CommonResponse;

  factory CommonResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CommonResponseFromJson<T>(json, fromJsonT);
}

@freezed
class CommonResponseStatus with _$CommonResponseStatus {
  factory CommonResponseStatus({
    required int statusCode,
    required String message,
  }) = _CommonResponseStatus;

  factory CommonResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseStatusFromJson(json);
}