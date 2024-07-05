import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/common/layout/home/component/home_app_bar.dart';
import 'package:gamemuncheol_upstream/common/layout/home/component/home_tab_bar.dart';
import 'package:gamemuncheol_upstream/common/layout/home/event/home_screen_event.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/board/presentation/view/screen/home/board_home.dart';
import 'package:gamemuncheol_upstream/feature/board/presentation/view/screen/recent/board_recent.dart';

enum Tabs {
  HOME("홈", HomeBoardScreen()),
  RECENT("최근", RecentBoardScreen()),
  HOT("인기", SizedBox()),
  LEGEND("레전드", SizedBox());

  final String name;
  final Widget screen;

  const Tabs(this.name, this.screen);
}

class HomeLayout extends ConsumerStatefulWidget {
  const HomeLayout({super.key});

  static const PATH = "/home";
  static const NAME = "HomeScreen";

  @override
  ConsumerState<HomeLayout> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeLayout>
    with HomeScreenEvent, SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late final TabController tabController =
      TabController(length: Tabs.values.length, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              /**
               * 앱바
               */
              HomeAppBar(
                onSearchIconTap: onSearchIconTap,
                onNotiIconTap: onNotiIconTap,
              ),
              /**
               * 탭바
               */
              SliverPersistentHeader(
                pinned: true,
                delegate: HomeTabBarDelegate(
                  move: (index) {
                    tabController.animateTo(index);
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  tabs: Tabs.values.map((e) => e.name).toList(),
                  index: currentIndex,
                ),
              ),
            ];
          },
          /**
           * 탭바 뷰
           */
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: Tabs.values.map((e) {
              return e.screen;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
