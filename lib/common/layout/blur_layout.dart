import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/component/loading_indicator.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';

class BlurLayout<T extends LoadingWithMessgeState> extends StatelessWidget {
  // 레이아웃을 적용할 scaffold
  final Widget scaffold;

  // 프로바이더, LoadingWithMessgeState를 사용해야 함!
  final ProviderListenable<T> provider;

  const BlurLayout({
    super.key,
    required this.scaffold,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    const double sigmaX = 5.0;
    const double sigmaY = 5.0;

    final textStyle = context.textStyles.base;

    return Material(
      child: Stack(
        children: [
          scaffold,
          Consumer(
            builder: (context, ref, child) {
              final T state = ref.watch(provider);

              if (state is! Loading) {
                return const SizedBox();
              }

              return BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: sigmaX,
                  sigmaY: sigmaY,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: LoadingIndicator(),
                      ),
                      if (state.message != null) Gap(18.h),
                      Text(
                        state.message ?? "",
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
