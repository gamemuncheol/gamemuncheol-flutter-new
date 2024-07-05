import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';

class FailedDialog extends StatelessWidget with ThemeProvider {
  final String title;
  final String description;
  final VoidCallback onTap;

  const FailedDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 스택으로 만들어야 해서 안 보이는 프레임 만들기
    final double frameWidth = 262.w;
    final double frameHeight = 330.h;
    final frameDeoration = BoxDecoration(color: context.colors.transParent);

    // 눈에 보이는 다이얼로그 높이
    final double dialogHeight = 280.h;
    final dialogDeo = BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: context.colors.natural02,
    );

    // 종 모양 아이콘 높이
    final double iconHeight = 130.h;

    return Stack(
      children: [
        Container(
          width: frameWidth,
          height: frameHeight,
          decoration: frameDeoration,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(30.h),
            Container(
              height: dialogHeight,
              decoration: dialogDeo,
              child: Column(
                children: [
                  _buildContent(
                    title: title,
                    description: description,
                  ),
                  Gap(22.h),
                  _buildBtn(),
                  Gap(26.h),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: frameWidth,
          height: iconHeight,
          child: Image.asset(AppAsset.DIALOG_ICON),
        ),
      ],
    );
  }

  Widget _buildContent({
    required String title,
    required String description,
  }) {
    final TextStyle titleStyle = textStyles.title4B;
    final TextStyle descriptionStyle =
        textStyles.body5R.copyWith(color: colors.natural06);

    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        Gap(18.h),
        Text(
          description,
          style: descriptionStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBtn() {
    final double width = 230.w;
    final double height = 44.h;

    final double horizontalMargin = 32.w;

    const String label = "확인";
    final TextStyle labelStyle =
        textStyles.body4M.copyWith(color: colors.onPrimaryBlue);

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: colors.primaryBlue,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        width: width,
        height: height,
        decoration: decoration,
        child: Center(
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}
