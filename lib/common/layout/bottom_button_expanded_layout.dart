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
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      backgroundColor: context.colors.background,
      body: Column(
        children: [
          Expanded(
            child: expanded,
          ),
          Visibility(
            visible: !isKeyboardVisible,
            child: SafeArea(
              top: false,
              child: bottomButton,
            ),
          )
        ],
      ),
    );
  }
}
