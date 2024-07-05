import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gap/gap.dart';

class PostSaveFormHeader extends StatelessWidget {
  final String title;
  final String description;

  const PostSaveFormHeader({
    super.key,
    required this.title,
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textStyles.title1M;

    final descriptionStyle =
        context.textStyles.body4R.copyWith(color: context.colors.natural06);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Gap(16.h),
        Text(
          description,
          style: descriptionStyle,
        ),
      ],
    );
  }
}
