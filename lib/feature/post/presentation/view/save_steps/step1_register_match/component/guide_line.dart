import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class GuideLine extends StatelessWidget {
  const GuideLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 24,
                color: context.colors.primaryBlue,
              ),
              Gap(8.w),
              Text(
                "게임 아이디는 여기서 찾으실 수 있어요.",
                style: context.textStyles.body5M
                    .copyWith(color: context.colors.primaryBlue),
              ),
            ],
          ),
        ),
        Gap(16.w),
        Image.asset(
          AppAsset.GAME_ID_GUIDE_GIF,
        ),
      ],
    );
  }
}
