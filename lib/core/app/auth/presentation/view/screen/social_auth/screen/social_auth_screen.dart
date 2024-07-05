// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_in_method.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/component/main_title.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/component/social_auth_button.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/social_auth/event/social_auth_screen_event.dart';

class SocialAuthScreen extends ConsumerStatefulWidget {
  const SocialAuthScreen({super.key});

  static final PATH = "/${NAME.toLowerCase()}";
  static const NAME = "SOCIAL_AUTH_SCREEN";

  @override
  ConsumerState<SocialAuthScreen> createState() => _SocialAuthScreenState();
}

class _SocialAuthScreenState extends ConsumerState<SocialAuthScreen>
    with SocialAuthScreenEvent {
  final videoController =
      VideoPlayerController.asset(AppAsset.AUTH_BACKGROUND_VIDEO);

  @override
  void initState() {
    super.initState();
    videoController.initialize().then((value) {
      videoController.play();
      videoController.setLooping(true);
    });
  }

  @override
  dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayer(
            videoController,
          ),
          Column(
            children: [
              Gap(148.h),
              const MainTitle(),
              Gap(148.h),
              SocialAuthButton.apple(
                onTap: () {
                  signIn(signInMethod: SignInMethod.apple);
                },
              ),
              Gap(26.h),
              SocialAuthButton.google(
                onTap: () {
                  signIn(signInMethod: SignInMethod.google);
                },
              ),
              Gap(74.h),
            ],
          )
        ],
      ),
    );
  }
}
