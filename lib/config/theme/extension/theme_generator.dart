import 'package:flutter/material.dart';

import 'package:gamemuncheol_upstream/config/theme/mode/dark_mode.dart';
import 'package:gamemuncheol_upstream/config/theme/mode/light_mode.dart';

enum ThemeEnum {
  light,
  dark,
}

extension ThemeGenerator on ThemeEnum {
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.dark:
        return DarkMode.instance.toThemeData();
      case ThemeEnum.light:
        return LightMode.instance.toThemeData();
    }
  }
}
