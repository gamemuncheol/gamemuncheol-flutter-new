import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_rate.freezed.dart';
part 'vote_rate.g.dart';

@freezed
class VoteOptionDetail with _$VoteOptionDetail {
  const factory VoteOptionDetail({
    required int matchUserId,
    required String nickname,
    required String championThumbnail,
    required int voteOptionsId,
  }) = _VoteOptionDetail;

  factory VoteOptionDetail.fromJson(Map<String, dynamic> json) =>
      _$VoteOptionDetailFromJson(json);
}
