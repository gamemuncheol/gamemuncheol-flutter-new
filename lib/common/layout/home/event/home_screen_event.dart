import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/layout/home/layout/home_layout.dart';
import 'package:gamemuncheol_upstream/common/util/role_method.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/social_auth/screen/social_auth_screen.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/screen/search_match_screen.dart';

mixin HomeScreenEvent on ConsumerState<HomeLayout>  {
  void onSearchIconTap() {
    context.push(SearchMatchScreen.PATH);
  }

  void onNotiIconTap() {
    ref.read(
      excecuteWhenProvider(
        guest: () {
          context.push(SocialAuthScreen.PATH);
        },
        user: () async {
          await ref.read(authNotifierProvider.notifier).signOut();
        },
      ),
    );
  }
}
