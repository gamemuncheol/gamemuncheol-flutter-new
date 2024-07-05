import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/screen/video_permission_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:permission_handler/permission_handler.dart';

mixin VideoPermissionScreenEvent on State<VideoPermissionScreen> {
  ValueNotifier<bool> get hasPermission;

  void request() {
    PermissionHandlerService.request(
      Permission.photos,
      onDeniedCallback: () {
        Fluttertoast.showToast(
          msg: "권한 거부 확인됨",
        );
      },
      onGrantedCallback: () {
        hasPermission.value = true;
        context.pop();
      },
    );
  }
}
