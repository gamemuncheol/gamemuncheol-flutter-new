import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/screen/post_form_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/thumbnail_setting_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/youtube_url_upload_screen.dart';

mixin YoutubeUrlUploadScreenEvent on ConsumerState<YoutubeUrlUploadScreen> {
  TextEditingController get searchController;

  void onLeadingTap() {
    // ignore: unused_result
    ref.refresh(uploadVideoNotifierProvider);
    context.pop();
  }

  Future<void> preview() async {
    context.pushNamed(
      ThumbnailSettingScreen.NAME,
      extra: await PermissionHandlerService.checkPermission(
        Permission.photos,
      ),
    );
  }

  void search() {
    ref
        .read(uploadVideoNotifierProvider.notifier)
        .uploadYoutubeUrl(searchController.text.trim());
  }

  void post() {
    context.pushNamed(PostFormScreen.NAME);
  }
}
