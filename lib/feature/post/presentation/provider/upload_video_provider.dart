import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/common/provider/base_notifier.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/video_upload_form.dart';
import 'package:gamemuncheol_upstream/feature/post/service/feed_service.dart';

final uploadVideoNotifierProvider =
    NotifierProvider<UploadVideoNotifier, BaseState<VideoUploadForm>>(() {
  return UploadVideoNotifier(postService: locator<PostService>());
});

class UploadVideoNotifier extends BaseNotifier<VideoUploadForm> {
  final PostService _postService;

  UploadVideoNotifier({required PostService postService})
      : _postService = postService;

  @override
  BaseState<VideoUploadForm> build() => Initial();

  Future<bool> uploadVideo() async {
    await notify(action: () => _postService.uploadVideo());
    return state.hasValue;
  }

  Future<void> enterYoutubeUrl(String youtubeUrl) async {
    notify(action: () => _postService.enterYoutubeUrl(youtubeUrl));
  }
}
