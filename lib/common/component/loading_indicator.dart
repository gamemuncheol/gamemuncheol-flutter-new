import 'package:flutter/material.dart';

import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  const LoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? context.colors.primaryBlue,
    );
  }
}
