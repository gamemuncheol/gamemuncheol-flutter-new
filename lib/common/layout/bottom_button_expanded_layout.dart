import 'package:flutter/material.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';

class BottomButtonExpanded extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget expanded;
  final Widget bottomButton;

  const BottomButtonExpanded({
    super.key,
    this.appBar,
    required this.expanded,
    required this.bottomButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      backgroundColor: context.colors.background,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: expanded,
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: bottomButton,
          ),
        ],
      ),
    );
  }
}
