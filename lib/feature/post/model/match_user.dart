import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_user.freezed.dart';
part 'match_user.g.dart';

@freezed
class MatchUser with _$MatchUser {
  const factory MatchUser({
    required int id,
    required String nickname,
    required String championName,
    required String championThumbnail,
    required bool win,
  }) = _MatchUser;

  factory MatchUser.fromJson(Map<String, dynamic> json) =>
      _$MatchUserFromJson(json);
}

