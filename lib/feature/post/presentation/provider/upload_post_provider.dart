import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/common/provider/base_notifier.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/post_save_form.dart';

import 'package:gamemuncheol_upstream/feature/post/service/post_service.dart';

final uploadPostNotifierProvider =
    NotifierProvider<UploadPostProvider, BaseState<void>>(() {
  return UploadPostProvider(postService: locator<PostService>());
});

class UploadPostProvider extends BaseNotifier<void> {
  final PostService _postService;

  UploadPostProvider({required PostService postService})
      : _postService = postService;

  @override
  BaseState<void> build() => Initial();

  Future<void> post(
      {required PostSaveForm form, required Uint8List thumbImageFile}) async {
    await notify(
      action: () async =>
          await _postService.post(form: form, thumbImageFile: thumbImageFile),
    );
  }
}
