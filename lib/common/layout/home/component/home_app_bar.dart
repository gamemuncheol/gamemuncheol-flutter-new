import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';

enum AppBarLeading {
  logo1(AppAsset.APP_LOGO),
  logo2(AppAsset.APP_BAR_LOGO_TEXT_PATH);

  final String iconPath;

  const AppBarLeading(this.iconPath);
}

enum AppBarAction {
  search(AppAsset.SEARCH_ICON_PATH),
  notification(AppAsset.NOTIFICATION_NEW_ICON_PATH);

  final String iconPath;

  const AppBarAction(this.iconPath);
}

class HomeAppBar extends ConsumerWidget {
  final VoidCallback onSearchIconTap;
  final VoidCallback onNotiIconTap;

  const HomeAppBar({
    super.key,
    required this.onSearchIconTap,
    required this.onNotiIconTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      snap: true,
      pinned: false,
      floating: true,
      backgroundColor: context.colors.background,
      leadingWidth: 170.w,
      leading: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 35.h,
              child: Image.asset(
                AppBarLeading.logo1.iconPath,
              ),
            ),
            Gap(10.w),
            SvgPicture.asset(
              AppBarLeading.logo2.iconPath,
            )
          ],
        ),
      ),
      actions: AppBarAction.values.map((action) {
        return GestureDetector(
          onTap: () {
            switch (action) {
              case AppBarAction.search:
                onSearchIconTap();
                break;
              case AppBarAction.notification:
                onNotiIconTap();
                break;
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: SvgPicture.asset(
              action.iconPath,
            ),
          ),
        );
      }).toList(),
    );
  }
}
