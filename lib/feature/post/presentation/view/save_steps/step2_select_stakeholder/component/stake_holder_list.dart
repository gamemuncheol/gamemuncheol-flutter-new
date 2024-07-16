import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/match_card.dart';

class StakeHolderList extends ConsumerWidget {
  final List<MatchUser> matchUsers;
  final void Function(MatchUser) updateStakeHolder;

  const StakeHolderList({
    super.key,
    required this.matchUsers,
    required this.updateStakeHolder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: matchUsers.length,
      itemBuilder: (context, index) {
        final MatchSaveForm state = ref.watch(matchSaveFormNotifierProvider);

        final MatchUser matchUser = matchUsers[index];
        final bool isMySelf = matchUser == state.stakeHolder;

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: GestureDetector(
            onTap: () => updateStakeHolder(matchUser),
            child: Container(
              color: context.colors.background,
              child: Row(
                children: [
                  SvgPicture.asset(
                    isMySelf
                        ? AppAsset.CHECKBOX_FILLED
                        : AppAsset.CHECKBOX_BLANK,
                  ),
                  Gap(15.w),
                  Expanded(
                    child: MatchCard.partOnly(
                      matchUser: matchUsers[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
