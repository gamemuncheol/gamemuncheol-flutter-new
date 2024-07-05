import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/common/component/square_button.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';

class PostSaveFormNextButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool? unable;
  final String? label;

  const PostSaveFormNextButton({
    super.key,
    required this.onTap,
    this.unable = false,
    this.label = "다음",
  });

  factory PostSaveFormNextButton.disAble() {
    return PostSaveFormNextButton(unable: true, onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration buttonDecoration = BoxDecoration(
        color: context.colors.primaryBlue.withOpacity(unable! ? 0.5 : 1));

    return SquareButton.label(
      onTap: onTap,
      label: label!,
      buttonDecoration: buttonDecoration,
    );
  }
}
