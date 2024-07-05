import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/theme_generator.dart';

// main.dart에서 유저 현재 세팅이랑 동기화
final ChangeNotifierProvider<ThemeManger> themeProvider =
    ChangeNotifierProvider((ref) => throw UnimplementedError());

abstract class ThemeManger extends ChangeNotifier {
  ThemeData get currentTheme;
  void changeTheme(ThemeEnum theme);
}

class ThemeManagerImpl extends ChangeNotifier implements ThemeManger {
  ThemeEnum currentThemeEnum;

  ThemeManagerImpl(this.currentThemeEnum) {
    currentTheme = currentThemeEnum.generateTheme;
  }

  @override
  late ThemeData currentTheme;

  @override
  void changeTheme(ThemeEnum newTheme) {
    if (newTheme != currentThemeEnum) {
      currentTheme = newTheme.generateTheme;
      currentThemeEnum = newTheme;
      notifyListeners();
    }
    return;
  }
}
