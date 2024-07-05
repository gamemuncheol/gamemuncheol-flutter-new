import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackgroundArea(),
        buildGradientUnderline(),
        buildTitle(context),
        buildMainTitleLogo(),
      ],
    );
  }

  Widget buildBackgroundArea() {
    final frameWidth = 390.w;
    final frameHeight = 280.h;

    return Center(
      child: SizedBox(
        width: frameWidth,
        height: frameHeight,
      ),
    );
  }

  Container buildGradientUnderline() {
    final leftMargin = 45.w;
    final topMargin = 140.h;
    final frameWidth = 300.w;

    return Container(
      width: frameWidth,
      padding: EdgeInsets.only(
        left: leftMargin,
        top: topMargin,
      ),
      child: SvgPicture.asset(
        AppAsset.LOL_MUNCHEOL_UNDERLINE_PATH,
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    const title = "정치질과 입롤에 지칠 때는\n112말고, 롤문철";
    const subTitle = "3초 가입으로 바로 시작하세요.";

    final topMargin = 210.h;

    final titleStyle =
        context.textStyles.title2M.copyWith(color: context.colors.primaryWhite);

    final subTitleStyle =
        context.textStyles.body3R.copyWith(color: titleStyle.color);

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: topMargin),
        child: Column(
          children: [
            Text(
              title,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            Gap(20.h),
            Text(
              subTitle,
              style: subTitleStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Positioned buildMainTitleLogo() {
    final frameHeight = 190.h;

    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: frameHeight,
          child: Image.asset(
            AppAsset.LOL_MUNCHEOL_LOGO,
          ),
        ),
      ),
    );
  }
}
