import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/model/policys.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/component/accpet_all_btn.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/component/policy_card.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/component/policy_screen_header.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/component/policy_screen_next_btn.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/event/policy_accept_screen_event.dart';

class PolicyAcceptScreen extends ConsumerStatefulWidget {
  const PolicyAcceptScreen({super.key});

  static const NAME = "POLICY_ACCEPT_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  ConsumerState<PolicyAcceptScreen> createState() =>
      _PrivacyPolicyAcceptScreenState();
}

class _PrivacyPolicyAcceptScreenState extends ConsumerState<PolicyAcceptScreen>
    with PolicyAcceptScreenEvent {
  @override
  Widget build(BuildContext context) {
    return BottomButtonExpanded(
      expanded: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Gap(30.h),
            // 헤더
            _buildHeader(),
            // 모두 동의 버튼
            _buildAcceptAllBtn(),
            // 구분선
            _buildDivider(),
            // 동의 항목들
            ...Policys.values.map((policy) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: PolicyCard(
                  description: policy.title,
                  accept: accept,
                  reject: reject,
                  listenGlobalEvent: listenGlobalEvent,
                ),
              );
            }).toList(),
          ],
        ),
      ),
      // 다음 버튼
      bottomButton: _buildNextBtn(),
    );
  }

  // 헤더
  Widget _buildHeader() {
    return const SafeArea(
      child: PolicyScreenHeader(
        title: "약관에 동의해 주세요",
        description: "여러분의 개인정보와 서비스 이용권리,\n잘 지켜드릴게요.",
      ),
    );
  }

  // 구분선
  Widget _buildAcceptAllBtn() {
    return AcceptAllBtn(
      acceptALl: acceptALl,
      rejectALl: rejectALl,
    );
  }

  // 요약본
  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      height: 1.h,
      color: context.colors.natural03,
    );
  }

  // 다음 버튼
  Widget _buildNextBtn() {
    return PolicyScreenNextBtn(
      onTap: seeSummary,
    );
  }
}
