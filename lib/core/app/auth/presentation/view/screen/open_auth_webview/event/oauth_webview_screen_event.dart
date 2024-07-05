import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';

import 'package:gamemuncheol_upstream/common/const/data.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/component/my_browser.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/view/screen/open_auth_webview/screen/oauth_webview_screen.dart';

mixin OauthWebviewScreenEvent on ConsumerState<OauthWebviewScreen> {
  ValueNotifier<TokenResponse?> get token;
  MyChromeSafariBrowser get chromeSafariBrowser;

  /**
   * 전체 플로우
   * 1. 웹뷰를 호출.
   * 2. 웹뷰에서 로그인 후 토큰을 받아서 앱으로 리다이렉트. (이건 flutter-web에서 수행)
   * 3. 쿼리 파람으로 넣어준 토큰을 확인.
   * 4. SocialAuthScreen으로 토큰 가지고 돌아가기.
   * */

  // 1. 웹뷰 호출
  void startOauth() {
    chromeSafariBrowser.open(
      // https://우리 파베 호스팅 웹 주소?signInMethod=${signInMethod.name}
      url: WebUri(
          "${AppData.OAUTH_WAS_URL}?signInMethod=${widget.signInMethod.name}"),
    );
  }

  // 3. 토큰 확인
  void listenUniLinks() {
    linkStream.listen((link) async {
      if (link != null) {
        token.value = _getToken(link: link);
        await chromeSafariBrowser.close();
      }
    });
  }

  // 3. 토큰 확인
  TokenResponse? _getToken({required String link}) {
    final uri = Uri.parse(link);

    if (uri.queryParameters.isEmpty) {
      return null;
    }

    final Map<String, String> params = uri.queryParameters;

    // 레디스 임시 토큰
    if (params.length == 1) {
      return TemporaryAccessed(
        TemporaryAccessedToken.fromJson(params),
      );
    } else {
      // 토큰이 두 개인 경우 == 진짜 토큰
      return FullyAccessed(
        FullyAccessedToken.fromJson(params),
      );
    }
  }
}
