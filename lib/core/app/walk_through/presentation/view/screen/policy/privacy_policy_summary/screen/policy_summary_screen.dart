import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/component/policy_screen_header.dart';
import 'package:gamemuncheol_upstream/core/app/walk_through/presentation/view/screen/policy/policy_accept/component/policy_screen_next_btn.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/view/nickname/screen/register_nickname_screen.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PolicySummaryScreen extends StatefulWidget {
  const PolicySummaryScreen({super.key});

  static const NAME = "POLICY_SUMMARY_SCREEN";
  static final PATH = "/${NAME.toLowerCase()}";

  @override
  State<PolicySummaryScreen> createState() => _PolicySummaryScreenState();
}

class _PolicySummaryScreenState extends State<PolicySummaryScreen> {
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
            // 구분선
            _buildDivider(),
            // 요약본
            const Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Text(
                  "요약",
                ),
              ),
            )
          ],
        ),
      ),
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
  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      height: 1.h,
      color: context.colors.natural03,
    );
  }

  // 요약본
  Widget _buildNextBtn() {
    return PolicyScreenNextBtn(
      onTap: () {
        context.pushReplacement(RegisterNicknameScreen.PATH);
      },
    );
  }
}
