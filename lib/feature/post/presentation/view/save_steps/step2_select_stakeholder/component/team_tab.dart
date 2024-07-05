import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class TeamTab extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;
  final String label;

  const TeamTab({
    super.key,
    required this.onTap,
    required this.selected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: context.colors.background,
          child: Column(
            children: [
              Text(
                label,
                style: context.textStyles.body2M.copyWith(
                  color: selected
                      ? context.colors.primaryBlue
                      : context.colors.natural05,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(10.h),
              Container(
                height: selected ? 4.5.h : 2.5.h,
                decoration: BoxDecoration(
                  color: selected
                      ? context.colors.primaryBlue
                      : context.colors.natural03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
