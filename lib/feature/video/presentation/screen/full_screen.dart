import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamemuncheol_upstream/common/util/system_util.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/video/presentation/component/amazon_player/custom_amazon_player.dart';

class FullScreen extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  final String? thumbnailUrl;
  final Uint8List? thumbnailByte;

  const FullScreen({
    super.key,
    required this.videoPlayerController,
    this.thumbnailUrl,
    this.thumbnailByte,
  });

  static const String NAME = "FULL_SCREEN";
  static final String PATH = "/${NAME.toLowerCase()}";

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (!isPortrait) {
          SystemUtil.portraitUp();
          return true;
        }

        return false;
      },
      child: Scaffold(
        appBar: isPortrait
            ? AppBar(
                backgroundColor: context.colors.transParent,
                leadingWidth: 40.w,
                leading: Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await videoPlayerController
                          .pause()
                          .whenComplete(context.pop);
                    },
                    child: SvgPicture.asset(
                      AppAsset.CHEVRON_LEFT_WHITE,
                    ),
                  ),
                ),
              )
            : null,
        backgroundColor: context.colors.black,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: isPortrait ? kToolbarHeight : 0,
          ),
          child: Center(
            child: CustomAmazonPlayer(
              videoPlayerController: videoPlayerController,
              thumbnailUrl: thumbnailUrl,
              thumbnailByte: thumbnailByte,
            ),
          ),
        ),
      ),
    );
  }
}
