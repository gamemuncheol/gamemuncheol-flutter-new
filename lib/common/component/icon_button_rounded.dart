import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class IconButtonRounded extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;
  final String label;
  final String iconPath;

  const IconButtonRounded({
    super.key,
    required this.onTap,
    required this.selected,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final buttonDeco = BoxDecoration(
      color: context.colors.primaryWhite,
      borderRadius: BorderRadius.circular(
        64,
      ),
      border: Border.all(
        color: selected ? context.colors.primaryBlue : context.colors.natural04,
      ),
    );

    final labelStyle = context.textStyles.body3M.copyWith(
        color:
            selected ? context.colors.primaryBlue : context.colors.natural04);

    final double width = 357.w;
    final double height = 64.h;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: buttonDeco,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: Image.asset(
                  iconPath,
                ),
              ),
              Gap(9.w),
              Text(
                label,
                style: labelStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
