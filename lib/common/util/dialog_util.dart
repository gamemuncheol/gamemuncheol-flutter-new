import 'package:flutter/material.dart';



mixin DialogUtil {
  Future<void> show(BuildContext context, {required Widget content}) async {
    await showDialog(
      context: context,
      builder: (context) {
        const double elevation = 0;

        return AlertDialog(
            alignment: Alignment.center,
            elevation: elevation,
            content: content);
      },
    );
  }
}
