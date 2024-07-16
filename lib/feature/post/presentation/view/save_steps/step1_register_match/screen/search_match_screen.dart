import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/feature/post/model/form/match_save_form_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/provider/search_match_provider.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/guide_line.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_app_bar.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_header.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/post_save_form_padding.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/search_field.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/component/searched_match_list.dart';
import 'package:gamemuncheol_upstream/feature/post/presentation/view/save_steps/step1_register_match/event/search_match_screen_event.dart';

class SearchMatchScreen extends ConsumerStatefulWidget {
  const SearchMatchScreen({super.key});

  static const NAME = "SEARCH_MATCH_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  ConsumerState<SearchMatchScreen> createState() => _SearchMatchScreenState();
}

class _SearchMatchScreenState extends ConsumerState<SearchMatchScreen>
    with SearchMatchScreenEvent {
  @override
  Widget build(BuildContext context) {
    return BottomButtonExpanded(
      appBar: PostSaveFormAppBar.step1(
        onLeadingTap: onLeadingTap,
      ).toPrefferedSize(),
      expanded: PostSaveFormPadding(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              /**
               * 헤더
               */
              const PostSaveFormHeader(
                title: "전적검색을 위해 게임ID\n를 입력해 주세요.",
                description: "명쾌하게 판단해 드려요.",
              ),
              Gap(80.h),
              /**
               * 검색창
               */
              SearchField(
                search: search,
              ),
              Gap(30.h),
              /**
               * 검색결과
               */
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(searchMatchNotifierProvider).when(
                        // 기본
                        orElse: () => const GuideLine(),
                        // 검색 결과 없는 경우
                        error: (message) => const Center(
                          child: Text(
                            "검색 결과가 없습니다.",
                          ),
                        ),
                        // 로딩
                        loading: () => Center(
                          child: CircularProgressIndicator(
                            color: context.colors.primaryBlue,
                          ),
                        ),
                        // 검색 완료
                        value: (value) => SearchedMatchList(
                          match: value,
                          updateMe: updateMe,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
      /**
       * 다음 버튼
       */
      bottomButton: Consumer(
        builder: (context, ref, child) {
          if (ref.watch(matchSaveFormNotifierProvider).me == null) {
            return PostSaveFormNextButton.disAble();
          }

          return PostSaveFormNextButton(
            onTap: selectStakeHolder,
          );
        },
      ),
    );
  }
}
