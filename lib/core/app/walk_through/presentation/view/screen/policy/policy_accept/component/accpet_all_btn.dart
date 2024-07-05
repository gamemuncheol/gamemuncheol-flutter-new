import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/provider/policy/policy_provider.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/provider/policy/policy_state.dart';

class AcceptAllBtn extends ConsumerWidget {
  final VoidCallback acceptALl;
  final VoidCallback rejectALl;

  const AcceptAllBtn({
    super.key,
    required this.acceptALl,
    required this.rejectALl,
  });

  final String title = "모두 동의";
  final String description = "서비스 이용을 위해 아래 약관에 모두 동의합니다.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(policyNotifierProvider).states ==
        PolicyStates.allAccepted;

    return GestureDetector(
      onTap: selected ? rejectALl : acceptALl,
      child: Container(
        color: context.colors.background,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  selected ? AppAsset.CHECKBOX_FILLED : AppAsset.CHECKBOX_BLANK,
                ),
                Gap(15.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textStyles.body3M,
                      ),
                      Gap(20.h),
                      Text(
                        description,
                        style: context.textStyles.body4R
                            .copyWith(color: context.colors.natural06),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
