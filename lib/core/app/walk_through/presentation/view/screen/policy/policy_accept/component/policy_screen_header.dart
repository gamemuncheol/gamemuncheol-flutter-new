import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';

class PolicyScreenHeader extends StatelessWidget with ThemeProvider {
  final String title;
  final String description;

  const PolicyScreenHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyles.title4M,
                  ),
                  Gap(12.h),
                  Text(
                    description,
                    style: textStyles.body4R.copyWith(color: colors.natural06),
                  ),
                ],
              ),
              GestureDetector(
                onTap: context.pop,
                child: SvgPicture.asset(
                  AppAsset.CLOSE_BLACK,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
