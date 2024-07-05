import 'package:flutter/material.dart';

import 'package:gamemuncheol_upstream/common/const/colors.dart';
import 'package:gamemuncheol_upstream/config/theme/app_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class LightMode extends AppTheme {
  static LightMode get instance {
    return LightMode._init();
  }

  LightMode._init();

  @override
  ThemeExtension<ThemeExtension> get textStyleTheme {
    return TextStyleTheme(AppColor.primaryBlack);
  }

  @override
  ThemeExtension get colorTheme => ColorTheme(
        natural02: AppColor.natural02,
        natural03: AppColor.natural03,
        natural04: AppColor.natural04,
        natural05: AppColor.natural05,
        natural06: AppColor.natural06,
        primaryBlue: AppColor.primaryBlue,
        onPrimaryBlue: AppColor.primaryWhite,
        primaryGreen: AppColor.primaryGreen,
        onPrimaryGreen: AppColor.primaryWhite,
        background: AppColor.primaryWhite,
      );

  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: false,
      dialogBackgroundColor: AppColor.transParent,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
    ).copyWith(
      extensions: [
        LightMode.instance.colorTheme,
        LightMode.instance.textStyleTheme,
      ],
    );
  }
}
