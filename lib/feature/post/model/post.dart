import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gamemuncheol_upstream/feature/member/model/member.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required Member member,
    required String videoUrl,
    required String thumbnailUrl,
    required String title,
    required String content,
    required String timesAgo,
    required int viewCount,
    required List<double> voteRatio,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required Member author,
    required String content,
    required String timesAgo,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
