import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

abstract class ThemeUtil {
  static late BuildContext _context;

  static void init(BuildContext context) => _context = context;

  static ColorTheme get colors => _context.colors;
  static TextStyleTheme get textStyles => _context.textStyles;
}

// stless에서 context 없이 theme 사용
mixin ThemeProvider {
  ColorTheme get colors => ThemeUtil.colors;
  TextStyleTheme get textStyles => ThemeUtil.textStyles;
}
