import 'package:flutter/services.dart';
import 'package:gamemuncheol_upstream/common/const/colors.dart';

class SystemUtil {
  static void setDefaultSystemUiMode() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
  }

  static void setWhiteThemeSystemUiMode() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.transParent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.transParent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static void portraitUp() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }
}
