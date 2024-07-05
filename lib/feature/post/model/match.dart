import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const factory Match({
    required String gameId,
    required String gameCreation,
    required int gameDuration,
    required String gameMode,
    required List<MatchUser> matchUsers,
  }) = _MatchHistory;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}
