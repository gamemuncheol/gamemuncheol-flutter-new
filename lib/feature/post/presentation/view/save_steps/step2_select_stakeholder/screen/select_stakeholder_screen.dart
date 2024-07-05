import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_padding.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step2_select_stakeholder/component/stake_holder_list.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step2_select_stakeholder/component/team_tab.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step2_select_stakeholder/event/selec_stake_holder_screen_event.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step3_upload_video/screen/video_upload_screen.dart';

class SelectStakeHolderScreen extends ConsumerStatefulWidget {
  const SelectStakeHolderScreen({super.key});

  static const NAME = "SELECT_STAKE_HOLDER_SCREEN";
  static final PATH = NAME.toLowerCase();

  @override
  ConsumerState<SelectStakeHolderScreen> createState() =>
      _SelectStakeholderScreenState();
}

class _SelectStakeholderScreenState
    extends ConsumerState<SelectStakeHolderScreen>
    with SelecTStakeHolderScreenEvent {
  @override
  final ValueNotifier<bool> inMyTeam = ValueNotifier(true);

  @override
  void dispose() {
    inMyTeam.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final match = ref.read(matchSaveFormNotifierProvider).match!;
    final me = ref.read(matchSaveFormNotifierProvider).me!;

    return BottomButtonExpanded(
      /**
       * 앱바
       */
      appBar: PostSaveFormAppBar.step2(
        onLeadingTap: context.pop,
      ).toPrefferedSize(),
      expanded: PostSaveFormPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /**
             * 헤더
             */
            const PostSaveFormHeader(
              title: "게임 상대를 선택해 주세\n요.",
            ),
            Gap(80.h),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: inMyTeam,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      /**
                       * 탭
                       */
                      Row(
                        children: [
                          TeamTab(
                            onTap: selectInTeam,
                            selected: value,
                            label: "아군",
                          ),
                          TeamTab(
                            onTap: selectInEnenmy,
                            selected: !value,
                            label: "적군",
                          ),
                        ],
                      ),
                      /**
                       * 유저 목록
                       */
                      Expanded(
                        child: StakeHolderList(
                          updateStakeHolder: updateStakeHolder,
                          matchUsers: match.matchUsers
                              .where((user) => value
                                  ? me.win == user.win
                                  : me.win != user.win)
                              .where((user) => user.id != me.id)
                              .toList(),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomButton: Consumer(
        builder: (context, ref, child) {
          if (ref.watch(matchSaveFormNotifierProvider).stakeHolder != null) {
            return PostSaveFormNextButton(onTap: () {
              context.pushNamed(VideoUploadScreen.NAME);
            });
          }

          return PostSaveFormNextButton.disAble();
        },
      ),
    );
  }
}
