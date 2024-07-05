import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? label;
  final TextStyle? labelStyle;
  final BoxDecoration? buttonDecoration;

  // 라벨 대신 커스텀 차일드
  final Widget? child;

  const SquareButton._({
    required this.onTap,
    this.buttonDecoration,
    this.label,
    this.labelStyle,
    this.child,
  });

  factory SquareButton.label({
    required VoidCallback onTap,
    required String label,
    TextStyle? labelStyle,
    BoxDecoration? buttonDecoration,
  }) {
    return SquareButton._(
      onTap: onTap,
      label: label,
      labelStyle: labelStyle,
      buttonDecoration: buttonDecoration,
    );
  }

  factory SquareButton.child({
    required VoidCallback onTap,
    required Widget child,
    BoxDecoration? buttonDecoration,
  }) {
    return SquareButton._(
      onTap: onTap,
      buttonDecoration: buttonDecoration,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = 60.h;

    final labelStyle = this.labelStyle ??
        context.textStyles.body2M.copyWith(color: context.colors.onPrimaryBlue);

    final decoration =
        buttonDecoration ?? BoxDecoration(color: context.colors.primaryBlue);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: decoration,
        child: Center(
          child: child ??
              Text(
                label!,
                style: labelStyle,
              ),
        ),
      ),
    );
  }
}
