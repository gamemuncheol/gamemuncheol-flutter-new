// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class HomeTabBar extends StatelessWidget with ThemeProvider {
  final void Function(int) move;
  final List<String> tabs;
  final int index;

  const HomeTabBar({
    super.key,
    required this.move,
    required this.tabs,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.background,
      padding: EdgeInsets.only(
        top: 15.h,
        left: 15.w,
        right: 15.w,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 1.5.h,
              decoration: BoxDecoration(
                color: context.colors.natural03,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabs
                .mapIndexed((index, label) => GestureDetector(
                      onTap: () => move(index),
                      child: _Tab(
                        selected: index == this.index,
                        label: label,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final bool selected;
  final String label;
  const _Tab({required this.selected, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textStyles.body3M.copyWith(
              color: selected
                  ? context.colors.primaryBlue
                  : context.colors.natural03,
            ),
          ),
          Container(
            height: selected ? 3.h : 1.5.h,
            decoration: BoxDecoration(
              color: selected
                  ? context.colors.primaryBlue
                  : context.colors.natural03,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeTabBarDelegate extends SliverPersistentHeaderDelegate {
  final void Function(int) move;
  final List<String> tabs;
  final int index;

  const HomeTabBarDelegate({
    required this.move,
    required this.tabs,
    required this.index,
  });

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      HomeTabBar(move: move, tabs: tabs, index: index);

  @override
  double get maxExtent => 50.h;

  @override
  double get minExtent => 50.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
