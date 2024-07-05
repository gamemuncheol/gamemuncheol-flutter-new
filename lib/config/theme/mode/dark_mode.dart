import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/common/const/colors.dart';
import 'package:gamemuncheol_upstream/config/theme/app_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class DarkMode extends AppTheme {
  static DarkMode get instance {
    return DarkMode._init();
  }

  DarkMode._init();

  @override
  ThemeExtension<ThemeExtension> get textStyleTheme {
    return TextStyleTheme(AppColor.primaryWhite);
  }

  @override
  ThemeExtension get colorTheme => ColorTheme(
        natural02: AppColor.natural06,
        natural03: AppColor.natural05,
        natural04: AppColor.natural04,
        natural05: AppColor.natural03,
        natural06: AppColor.natural02,
        primaryBlue: AppColor.primaryBlue,
        onPrimaryBlue: AppColor.primaryBlack,
        primaryGreen: AppColor.primaryGreen,
        onPrimaryGreen: AppColor.primaryBlack,
        background: AppColor.primaryBlack,
      );

  toThemeData() {
    return ThemeData(
      useMaterial3: false,
      dialogBackgroundColor: AppColor.transParent,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
    ).copyWith(
      extensions: [
        DarkMode.instance.colorTheme,
        DarkMode.instance.textStyleTheme,
      ],
    );
  }
}
