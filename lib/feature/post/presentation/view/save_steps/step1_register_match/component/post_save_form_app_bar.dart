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
    const double elevation = 0;
    const int totalStep = 5;

    final double leadingWidth = 44.w;
    final leadingPadding = EdgeInsets.only(left: 16.w);

    final actionPadding = EdgeInsets.only(right: 16.w);

    final TextStyle stepStyle =
        context.textStyles.body3R.copyWith(color: context.colors.natural04);

    return AppBar(
      elevation: elevation,
      backgroundColor: context.colors.background,
      leadingWidth: leadingWidth,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: leadingPadding,
          child: SvgPicture.asset(
            AppAsset.CHEVRON_LEFT_BLACK,
          ),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: actionPadding,
            child: Row(
              children: [
                Text(
                  "$currentStep/$totalStep",
                  style: stepStyle,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
