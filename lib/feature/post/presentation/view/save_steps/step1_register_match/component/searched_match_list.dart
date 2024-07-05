import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match.dart';
import 'package:gamemuncheol_upstream/feature/post/model/match_user.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/match_card.dart';
import 'package:gap/gap.dart';

class SearchedMatchList extends ConsumerWidget {
  final Match match;
  final void Function(MatchUser me) updateMe;

  const SearchedMatchList({
    super.key,
    required this.match,
    required this.updateMe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "검색 결과",
              style: context.textStyles.cap1,
            ),
          ],
        ),
        Gap(10.h),
        Expanded(
          child: ListView.builder(
            itemCount: match.matchUsers.length,
            itemBuilder: (context, index) {
              final MatchSaveForm state =
                  ref.watch(matchSaveFormNotifierProvider);

              final MatchUser matchUser = match.matchUsers[index];
              final bool isMySelf = matchUser == state.me;

              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: GestureDetector(
                  onTap: () => updateMe(matchUser),
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
                          child: MatchCard.fullInfo(
                            matchUser: match.matchUsers[index],
                            gameCreation: match.gameCreation,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
