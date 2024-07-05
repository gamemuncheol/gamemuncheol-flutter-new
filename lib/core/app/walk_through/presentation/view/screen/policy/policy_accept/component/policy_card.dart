import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/util/theme_provider.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';

class PolicyCard extends ConsumerWidget with ThemeProvider {
  final bool isUnNeccesary;
  final String description;

  final void Function({
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) accept;

  final void Function({
    required bool isUnNeccesary,
    required ValueNotifier<bool> isAccepted,
  }) reject;

  final void Function(
    WidgetRef ref, {
    required ValueNotifier<bool> isAccepted,
  }) listenGlobalEvent;

  const PolicyCard({
    super.key,
    this.isUnNeccesary = false,
    required this.description,
    required this.accept,
    required this.reject,
    required this.listenGlobalEvent,
  });

  void _toggle(ValueNotifier<bool> isAccepted) {
    if (isAccepted.value) {
      reject(
        isAccepted: isAccepted,
        isUnNeccesary: isUnNeccesary,
      );
    } else {
      accept(
        isAccepted: isAccepted,
        isUnNeccesary: isUnNeccesary,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> isAccepted = ValueNotifier(false);
    listenGlobalEvent(ref, isAccepted: isAccepted);

    return Container(
      color: context.colors.background,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _toggle(isAccepted);
              },
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: isAccepted,
                    builder: (context, value, child) {
                      return SvgPicture.asset(
                        value
                            ? AppAsset.CHECKBOX_FILLED
                            : AppAsset.CHECKBOX_BLANK,
                      );
                    },
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Gap(12.h),
                        Expanded(
                          child: Text(
                            description,
                            style: textStyles.body4R,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            AppAsset.CHEVRON_RIGHT_BLACK,
          ),
        ],
      ),
    );
  }
}
