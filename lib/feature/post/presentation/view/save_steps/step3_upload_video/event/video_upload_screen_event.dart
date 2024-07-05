import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/video_permission_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/video_upload_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

mixin VideoUploadScreenEvent on ConsumerState<VideoUploadScreen> {
  void uploadVideo() async {
    Platform.isAndroid
        ? await ref
            .read(uploadVideoNotifierProvider.notifier)
            .uploadVideo()
            .then((_) {})
        : await PermissionHandlerService.checkPermission(
            Permission.photos,
          ).then(
            (hasPermission) async {
              if (hasPermission) {
                await ref
                    .read(uploadVideoNotifierProvider.notifier)
                    .uploadVideo()
                    .then((_) {});
              } else {
                context.push(VideoPermissionScreen.PATH);
              }
            },
          );
  }
}
