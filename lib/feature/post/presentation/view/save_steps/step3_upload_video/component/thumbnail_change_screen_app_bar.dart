import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class ThumbnailChangeScreenAppBar extends StatelessWidget {
  final VoidCallback onLeadingTap;

  const ThumbnailChangeScreenAppBar({
    super.key,
    required this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
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
      centerTitle: true,
      title: Text(
        "썸네일 설정",
        style: context.textStyles.body3R,
      ),
    );
  }
}
