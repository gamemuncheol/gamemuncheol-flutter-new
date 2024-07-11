import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/upload_video_provider.dart';

class ErrorText extends ConsumerWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(uploadVideoNotifierProvider).when(
      error: (message) {
        return Text(
          message,
          style: context.textStyles.cap1.copyWith(
            color: context.colors.errorRed,
          ),
        );
      },
      orElse: () {
        return const SizedBox();
      },
    );
  }
}
