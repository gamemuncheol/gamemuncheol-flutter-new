import 'package:flutter/material.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';

typedef CounterBuilder = Widget? Function(
  BuildContext context, {
  required bool isFocused,
  required int? maxLength,
  required int currentLength,
})?;

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final CounterBuilder? counterBuilder;
  final bool isUnderLineTextFormField;
  final InputDecoration? inputDeco;
  final TextStyle? errorStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final GlobalKey? fieldKey;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.textEditingController,
    this.onTapOutside,
    this.validator,
    this.counterBuilder,
    this.isUnderLineTextFormField = false,
    this.inputDeco,
    this.errorStyle,
    this.textStyle,
    this.hintStyle,
    this.fieldKey,
    this.hintText,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final defaultErrorStyle =
        context.textStyles.body5R.copyWith(color: context.colors.errorRed);
    final defaultHintStyle =
        context.textStyles.body4M.copyWith(color: context.colors.natural03);

    final defaultEnableBorderSide = BorderSide(color: context.colors.natural02);
    final defaultFocusedBorderSide =
        BorderSide(color: context.colors.primaryBlue);

    final defaultEnableErrorBorderSide =
        BorderSide(color: context.colors.errorRed);
    final defaultFocusedErrorBorderSide =
        BorderSide(color: context.colors.errorRed);

    return TextFormField(
      autofocus: false,
      key: fieldKey,
      controller: textEditingController,
      onTapOutside: onTapOutside,
      onTap: () {
        if (fieldKey != null) {
          // Scrollable.ensureVisible(fieldKey!.currentContext!);
        }
      },
      validator: validator,
      buildCounter: counterBuilder,
      style: textStyle,
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: context.colors.primaryBlue,
      decoration: inputDeco ??
          InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? defaultHintStyle,
            errorStyle: errorStyle ?? defaultErrorStyle,
            counterText: counterBuilder == null ? "" : null,
            enabledBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(borderSide: defaultEnableBorderSide)
                : OutlineInputBorder(borderSide: defaultEnableBorderSide),
            focusedBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(borderSide: defaultFocusedBorderSide)
                : OutlineInputBorder(borderSide: defaultFocusedBorderSide),
            errorBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(borderSide: defaultEnableErrorBorderSide)
                : OutlineInputBorder(borderSide: defaultEnableErrorBorderSide),
            focusedErrorBorder: isUnderLineTextFormField
                ? UnderlineInputBorder(
                    borderSide: defaultFocusedErrorBorderSide)
                : OutlineInputBorder(borderSide: defaultFocusedErrorBorderSide),
          ),
    );
  }
}
