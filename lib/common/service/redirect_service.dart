import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/config/router/redirect_state.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_state.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/social_auth/screen/social_auth_screen.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/screen/policy_accept_screen.dart';

part 'redirect_service.g.dart';

@Riverpod(keepAlive: true)
RedirectService redirectService(RedirectServiceRef ref) {
  final RedirectService redirectInjectionService = RedirectService();

  ref.listen(authNotifierProvider, (previous, next) {
    switch (next.authStates) {
      case AuthStates.temporary:
        redirectInjectionService.whenTemporary();

      default:
        break;
    }
  });

  return redirectInjectionService;
}

class RedirectService {
  final ValueNotifier<RedirectState> redirectState =
      ValueNotifier<RedirectState>(RedirectState.pass);

  void whenTemporary() {
    redirectState.value = RedirectState.temporary;
  }

  String? redirectLogic(BuildContext context, GoRouterState goRouterState) {
    final RedirectState redirectState = this.redirectState.value;
    final String matchedLocation = goRouterState.matchedLocation;

    // 임시 키를 가지고 있는 경우 바로 개인정보처리방침 동의하러 ㄱㄱ
    if (matchedLocation == SocialAuthScreen.PATH &&
        redirectState == RedirectState.temporary) {
      return PolicyAcceptScreen.PATH;
    }

    return null;
  }
}
