import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/video_upload_screen.dart';

mixin VideoUploadScreenEvent on ConsumerState<VideoUploadScreen> {
  ValueNotifier<bool> get fromGallery;

  Future<bool> uploadVideo() async {
    if (Platform.isAndroid) {
      return await ref.read(uploadVideoNotifierProvider.notifier).uploadVideo();
    }

    final bool hasPermission = await PermissionHandlerService.checkPermission(
      Permission.photos,
    );

    if (hasPermission) {
      return await ref.read(uploadVideoNotifierProvider.notifier).uploadVideo();
    }

    return false;
  }

  void uploadFromGallery() {
    fromGallery.value = true;
  }

  void uploadYoutubeUrl() {
    fromGallery.value = false;
  }
}
