import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol_upstream/common/component/icon_button_rounded.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/event/video_permission_screen_event.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VideoPermissionScreen extends StatefulWidget {
  const VideoPermissionScreen({super.key});

  static const NAME = "VIDEO_PERMISSION_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  State<VideoPermissionScreen> createState() => _VideoPermissionScreenState();
}

class _VideoPermissionScreenState extends State<VideoPermissionScreen>
    with VideoPermissionScreenEvent {
  @override
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
              title: "앨범 접근 권한을\n허용해 주세요.",
            ),
          ),
          Gap(60.h),
          Center(
            child: ValueListenableBuilder(
              valueListenable: hasPermission,
              builder: (context, value, child) {
                return IconButtonRounded(
                  onTap: request,
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
