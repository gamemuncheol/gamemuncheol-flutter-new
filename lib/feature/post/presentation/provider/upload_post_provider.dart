import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/common/provider/base_notifier.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/post.dart';

import 'package:gamemuncheol_upstream/feature/post/service/feed_service.dart';

final uploadPostNotifierProvider =
    NotifierProvider<UploadPostProvider, BaseState<Post>>(() {
  return UploadPostProvider(postService: locator<PostService>());
});

class UploadPostProvider extends BaseNotifier<Post> {
  final PostService _postService;

  UploadPostProvider({required PostService postService})
      : _postService = postService;

  @override
  BaseState<Post> build() => Initial();

  Future<bool> post({
    required String videoUrl,
    required Uint8List thumbImageFile,
    required String title,
    required String content,
    required List<int> matchUserIds,
    required List<String> tags,
  }) async {
    state = Loading(
      message: "피드 업로드 중..",
    );

    final post = await _postService.post(
        videoUrl: videoUrl,
        thumbImageFile: thumbImageFile,
        title: title,
        content: content,
        matchUserIds: matchUserIds,
        tags: tags);

    return post.when(
      success: (post) {
        state = Value(valueOrNull: post);
        return true;
      },
      failure: (e) {
        state = Error(error: e);
        return false;
      },
    );
  }
}
