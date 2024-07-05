import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamemuncheol_upstream/core/resource/base_error.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(
    T data,
  ) = Success<T>;

  const factory Result.failure(
    BaseError error,
  ) = Failure<T>;
}
