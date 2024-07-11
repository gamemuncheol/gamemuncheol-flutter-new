import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/video_upload_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/youtube_url_upload_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step4_post_form/screen/post_form_screen.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/video_permission_screen.dart';

mixin VideoUploadScreenEvent on ConsumerState<VideoUploadScreen> {
  ValueNotifier<bool> get fromGallery;

  void onLeadingTap() {
    context.pop();
  }

  Future<void> uploadVideo() async {
    // 안드로이드는 권한이 필요 없음
    if (Platform.isAndroid) {
      await ref
          .read(uploadVideoNotifierProvider.notifier)
          .uploadVideo()
          .then((isUploaded) {
        context.pushNamed(PostFormScreen.NAME);
      });

      return;
    }

    // ios 권한 확인
    await PermissionHandlerService.checkPermission(
      Permission.photos,
    ).then((hasPermission) async {
      if (!hasPermission) {
        context.pushNamed(VideoPermissionScreen.NAME);
        return;
      }

      await ref
          .read(uploadVideoNotifierProvider.notifier)
          .uploadVideo()
          .then((isUploaded) async {
        if (isUploaded) {
          context.pushNamed(PostFormScreen.NAME);
        }
      });
    });
  }

  void uploadYoutubeUrl() {
    // ignore: unused_result
    ref.refresh(uploadVideoNotifierProvider);
    context.pushNamed(YoutubeUrlUploadScreen.NAME);
  }

  void uploadFromGallery() {
    fromGallery.value = true;
  }

  void uploadFromYoutubeUrl() {
    fromGallery.value = false;
  }
}
