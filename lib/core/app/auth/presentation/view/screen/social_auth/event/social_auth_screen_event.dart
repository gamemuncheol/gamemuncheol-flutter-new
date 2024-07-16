// ignore_for_file: use_build_context_synchronously

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/core/app/auth/model/sign_in_method.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/open_auth_webview/screen/oauth_webview_screen.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/social_auth/screen/social_auth_screen.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/screen/policy_accept_screen.dart';
import 'package:gamemuncheol_upstream/core/resource/extra.dart';

mixin SocialAuthScreenEvent on ConsumerState<SocialAuthScreen> {
  /**
   * 로그인
   * 웹뷰로 로그인하고 pop으로 다시 돌아올 때,
   * 데이터를 가지고 돌아오면 로그인에 성공한 거임
   */
  Future<void> signIn({required SignInMethod signInMethod}) async {
    await context
        .push(
      OauthWebviewScreen.PATH,
      extra: Extra({"signInMethod": signInMethod}),
    )
        .then((value) {
      // 1. 도중 로그인 중단 시 홈으로(가지고 온 데이터가 없는 경우)
      if (value == null) {
        context.pop();
        return;
      }

      final TokenResponse tokenResponse = value as TokenResponse;
      tokenResponse.when(
        fully: (token) async {
          // 2. 토큰 업데이트하고 홈으로(완전히 인증된 토큰을 가져 온 경우)
          await ref.read(authNotifierProvider.notifier).signIn(token: token);
          context.pop();
        },
        tempo: (temp) async {
          // 3. 토큰 업데이트하고 회원가입 하러감(임시 토큰을 가져 온 경우)
          await ref.read(authNotifierProvider.notifier).signInTemp(token: temp);
          context.pushReplacement(PolicyAcceptScreen.PATH);
        },
      );
    });
  }
}
