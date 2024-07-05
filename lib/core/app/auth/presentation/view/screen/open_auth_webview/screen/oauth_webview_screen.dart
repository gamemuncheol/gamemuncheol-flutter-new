// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/component/loading_indicator.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_in_method.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/component/my_browser.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/open_auth_webview/event/oauth_webview_screen_event.dart';

class OauthWebviewScreen extends ConsumerStatefulWidget {
  final SignInMethod signInMethod;

  const OauthWebviewScreen({super.key, required this.signInMethod});

  static final PATH = "/${NAME.toLowerCase()}";
  static const NAME = "OAUTH_WEBVIEW_SCREEN";

  // 애플 웹뷰 스크린
  factory OauthWebviewScreen.apple() =>
      const OauthWebviewScreen(signInMethod: SignInMethod.apple);

  // 구글 웹뷰 스크린
  factory OauthWebviewScreen.google() =>
      const OauthWebviewScreen(signInMethod: SignInMethod.google);

  @override
  ConsumerState<OauthWebviewScreen> createState() => _OauthWebviewScreenState();
}

class _OauthWebviewScreenState extends ConsumerState<OauthWebviewScreen>
    with OauthWebviewScreenEvent {
  @override
  final ValueNotifier<TokenResponse?> token = ValueNotifier(null);

  @override
  late final chromeSafariBrowser = MyChromeSafariBrowser(onClosedCallBack: () {
    // 4. SocialAuthScreen으로 토큰 가지고 돌아가기
    context.pop(token.value);
  });

  @override
  void initState() {
    listenUniLinks();
    startOauth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
