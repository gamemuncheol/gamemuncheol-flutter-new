// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleThemeShortcut on BuildContext {
  TextStyleTheme get textStyles => Theme.of(this).extension<TextStyleTheme>()!;
}

class TextStyleTheme extends ThemeExtension<TextStyleTheme> {
  final Color defaultColor;
  late final base = const TextStyle(letterSpacing: -0.50, height: 1)
      .copyWith(color: defaultColor);

  TextStyleTheme(this.defaultColor);

  late final TextStyle bold = base.copyWith(fontWeight: FontWeight.w900);
  late final TextStyle medium = base.copyWith(fontWeight: FontWeight.w700);
  late final TextStyle regular = base.copyWith(fontWeight: FontWeight.w500);

  late final TextStyle title1B = bold.copyWith(fontSize: 26.sp);
  late final TextStyle title2B = bold.copyWith(fontSize: 24.sp);
  late final TextStyle title3B = bold.copyWith(fontSize: 22.sp);
  late final TextStyle title4B = bold.copyWith(fontSize: 20.sp);
  late final TextStyle title5B = bold.copyWith(fontSize: 18.sp);

  late final TextStyle title1M = medium.copyWith(fontSize: 26.sp);
  late final TextStyle title2M = medium.copyWith(fontSize: 24.sp);
  late final TextStyle title3M = medium.copyWith(fontSize: 22.sp);
  late final TextStyle title4M = medium.copyWith(fontSize: 20.sp);
  late final TextStyle title5M = medium.copyWith(fontSize: 18.sp);

  late final TextStyle body1M = medium.copyWith(fontSize: 22.sp);
  late final TextStyle body2M = medium.copyWith(fontSize: 20.sp);
  late final TextStyle body3M = medium.copyWith(fontSize: 18.sp);
  late final TextStyle body4M = medium.copyWith(fontSize: 16.sp);
  late final TextStyle body5M = medium.copyWith(fontSize: 14.sp);

  late final TextStyle body1R = regular.copyWith(fontSize: 22.sp);
  late final TextStyle body2R = regular.copyWith(fontSize: 20.sp);
  late final TextStyle body3R = regular.copyWith(fontSize: 18.sp);
  late final TextStyle body4R = regular.copyWith(fontSize: 16.sp);
  late final TextStyle body5R = regular.copyWith(fontSize: 14.sp);

  late final TextStyle cap1 = regular.copyWith(fontSize: 13.sp);
  late final TextStyle cap2 = regular.copyWith(fontSize: 12.sp);

  @override
  TextStyleTheme copyWith() {
    return TextStyleTheme(defaultColor);
  }

  @override
  ThemeExtension<TextStyleTheme> lerp(
      covariant ThemeExtension<TextStyleTheme>? other, double t) {
    return other is! TextStyleTheme
        ? this
        : TextStyleTheme(
            Color.lerp(defaultColor, other.defaultColor, t)!,
          );
  }
}
