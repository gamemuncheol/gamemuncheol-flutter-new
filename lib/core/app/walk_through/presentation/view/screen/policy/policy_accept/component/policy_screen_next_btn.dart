import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol_upstream/common/component/square_button.dart';

class PolicyScreenNextBtn extends ConsumerWidget {
  final VoidCallback onTap;
  const PolicyScreenNextBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SquareButton.label(
      onTap: onTap,
      label: "다음",
    );
  }
}
