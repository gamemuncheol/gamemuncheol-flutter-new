import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamemuncheol_upstream/common/component/icon_button_rounded.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoPermissionScreen extends StatefulWidget {
  const VideoPermissionScreen({super.key});

  static const NAME = "VIDEO_PERMISSION_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  State<VideoPermissionScreen> createState() => _VideoPermissionScreenState();
}

class _VideoPermissionScreenState extends State<VideoPermissionScreen> {
  final hasPermission = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            right: 15.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: context.pop,
                child: SvgPicture.asset(
                  AppAsset.CLOSE_BLACK,
                ),
              ),
            ],
          ),
        ),
      ).toPrefferedSize(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 60.h,
              left: 15.w,
            ),
            child: const PostSaveFormHeader(
              title: "앨범 접근 권한이\n필요합니다.",
            ),
          ),
          Gap(60.h),
          Center(
            child: ValueListenableBuilder(
              valueListenable: hasPermission,
              builder: (context, value, child) {
                return IconButtonRounded(
                  onTap: () {
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
                  },
                  selected: value,
                  label: "앨범 읽기 쓰기 허용",
                  iconPath: value ? AppAsset.GALLER_ON : AppAsset.GALLERY_OFF,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
