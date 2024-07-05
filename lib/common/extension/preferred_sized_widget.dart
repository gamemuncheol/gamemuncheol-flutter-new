import 'package:flutter/material.dart';

extension PreferredSizedWidget on Widget {
  PreferredSize toPrefferedSize() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: this,
    );
  }
}
