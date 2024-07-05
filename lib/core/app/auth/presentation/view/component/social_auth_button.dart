import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/const/colors.dart';

class SocialAuthButton extends ConsumerWidget {
  final VoidCallback onTap;
  final String logoPath;
  final String label;
  final Color labelColor;
  final Color backgroundColor;

  const SocialAuthButton({
    super.key,
    required this.onTap,
    required this.logoPath,
    required this.label,
    required this.labelColor,
    required this.backgroundColor,
  });

  factory SocialAuthButton.apple({required VoidCallback onTap}) {
    const String logPath = AppAsset.APPLE_LOGO;
    const String lable = "Apple로 계속하기";
    const Color lableColor = AppColor.primaryWhite;
    const Color backgroundColor = AppColor.natural06;

    return SocialAuthButton(
      onTap: onTap,
      logoPath: logPath,
      label: lable,
      labelColor: lableColor,
      backgroundColor: backgroundColor,
    );
  }

  factory SocialAuthButton.google({required VoidCallback onTap}) {
    const String logPath = AppAsset.GOOGLE_LOGO;
    const String lable = "Google로 계속하기";
    const Color lableColor = AppColor.natural06;
    const Color backgroundColor = AppColor.white;

    return SocialAuthButton(
      onTap: onTap,
      logoPath: logPath,
      label: lable,
      labelColor: lableColor,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double buttonWidth = 358.w;
    final double buttonHegith = 50.h;

    final labelStyle = context.textStyles.body3M.copyWith(color: labelColor);
    final BoxDecoration buttonDecoration = BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(54),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHegith,
        decoration: buttonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(logoPath),
            Gap(12.w),
            Text(
              label,
              style: labelStyle,
            ),
          ],
        ),
      ),
    );
  }
}
