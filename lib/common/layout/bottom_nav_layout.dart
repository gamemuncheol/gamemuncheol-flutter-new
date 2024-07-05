import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/layout/home/layout/home_layout.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

enum Nav {
  HOME(
    0,
    "홈",
    AppAsset.NAV_HOME_ON,
    AppAsset.NAV_HOME_OFF,
    HomeLayout.PATH,
  ),
  LIKE(
    1,
    "좋아요",
    AppAsset.NAV_LIKE_OFF,
    AppAsset.NAV_LIKE_OFF,
    "/second",
  ),
  WRITE(
    2,
    "등록",
    AppAsset.NAV_WRITE_ON,
    AppAsset.NAV_WRITE_OFF,
    "/second",
  ),
  CHAT(
    3,
    "롤문톡",
    AppAsset.NAV_CHAT_OFF,
    AppAsset.NAV_CHAT_OFF,
    "/second",
  ),
  MY(
    4,
    "MY",
    AppAsset.NAV_LIKE_OFF,
    AppAsset.NAV_LIKE_OFF,
    "/second",
  );

  final int indexx;
  final String label;
  final String iconPathON;
  final String iconPathOFF;
  final String routePath;

  const Nav(
    this.indexx,
    this.label,
    this.iconPathON,
    this.iconPathOFF,
    this.routePath,
  );
}

class BottomNavLayout extends StatelessWidget {
  final Widget child;

  const BottomNavLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      bottomNavigationBar: const _BottomNav(),
      body: child,
    );
  }
}

class _BottomNav extends StatefulWidget {
  const _BottomNav();

  @override
  State<_BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<_BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        height: 70.h,
        decoration: BoxDecoration(
          color: context.colors.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Nav.values.map((navItem) {
            final bool selected = _currentIndex == navItem.index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  context.go(navItem.routePath);
                  _currentIndex = navItem.index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _BottomNavIcon(
                    iconPath:
                        selected ? navItem.iconPathON : navItem.iconPathOFF,
                  ),
                  Gap(7.5.h),
                  _BottomNavLabel(
                    selected: selected,
                    label: navItem.label,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BottomNavIcon extends StatelessWidget {
  final String iconPath;

  const _BottomNavIcon({
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 30.w,
      height: 30.h,
      iconPath,
    );
  }
}

class _BottomNavLabel extends StatelessWidget {
  final bool selected;
  final String label;

  const _BottomNavLabel({
    required this.selected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.textStyles.body4R.copyWith(
        color: selected ? context.colors.primaryBlue : context.colors.natural05,
      ),
    );
  }
}
