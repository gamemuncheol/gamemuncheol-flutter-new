import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class PostSaveFormAppBar extends StatelessWidget {
  final VoidCallback onLeadingTap;
  final int currentStep;

  const PostSaveFormAppBar({
    super.key,
    required this.onLeadingTap,
    required this.currentStep,
  });

  factory PostSaveFormAppBar.step1({required VoidCallback onLeadingTap}) {
    return PostSaveFormAppBar(onLeadingTap: onLeadingTap, currentStep: 1);
  }
  factory PostSaveFormAppBar.step2({required VoidCallback onLeadingTap}) {
    return PostSaveFormAppBar(onLeadingTap: onLeadingTap, currentStep: 2);
  }
  factory PostSaveFormAppBar.step3({required VoidCallback onLeadingTap}) {
    return PostSaveFormAppBar(onLeadingTap: onLeadingTap, currentStep: 3);
  }
  factory PostSaveFormAppBar.step4({required VoidCallback onLeadingTap}) {
    return PostSaveFormAppBar(onLeadingTap: onLeadingTap, currentStep: 4);
  }

  factory PostSaveFormAppBar.step5({required VoidCallback onLeadingTap}) {
    return PostSaveFormAppBar(onLeadingTap: onLeadingTap, currentStep: 5);
  }

  @override
  Widget build(BuildContext context) {
    const int totalStep = 5;

    return AppBar(
      elevation: 0,
      backgroundColor: context.colors.background,
      leadingWidth: 45.w,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
          ),
          child: SvgPicture.asset(
            AppAsset.CHEVRON_LEFT_BLACK,
          ),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: 15.w,
            ),
            child: Row(
              children: [
                Text(
                  "$currentStep/$totalStep",
                  style: context.textStyles.body3R.copyWith(
                    color: context.colors.natural04,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
