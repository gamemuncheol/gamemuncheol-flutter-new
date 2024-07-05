import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response.g.dart';
part 'token_response.freezed.dart';

@freezed
sealed class TokenResponse with _$TokenResponse {
  const factory TokenResponse.fully(
    FullyAccessedToken token,
  ) = FullyAccessed;

  const factory TokenResponse.tempo(
    TemporaryAccessedToken temp,
  ) = TemporaryAccessed;
}

@freezed
class FullyAccessedToken with _$FullyAccessedToken {
  factory FullyAccessedToken({
    required String accessToken,
    required String refreshToken,
  }) = _FullyAccessedToken;

  factory FullyAccessedToken.fromJson(Map<String, dynamic> json) =>
      _$FullyAccessedTokenFromJson(json);
}

@freezed
class TemporaryAccessedToken with _$TemporaryAccessedToken {
  factory TemporaryAccessedToken({
    required String temporaryUserKey,
  }) = _TemporaryAccessedToken;

  factory TemporaryAccessedToken.fromJson(Map<String, dynamic> json) =>
      _$TemporaryAccessedTokenFromJson(json);
}
