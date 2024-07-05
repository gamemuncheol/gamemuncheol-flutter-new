import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol_upstream/common/component/loading_indicator.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol_upstream/common/component/custom_text_form_filed.dart';
import 'package:gamemuncheol_upstream/common/component/square_button.dart';
import 'package:gamemuncheol_upstream/common/const/assets.dart';
import 'package:gamemuncheol_upstream/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol_upstream/common/layout/bottom_button_expanded_layout.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/color_theme.dart';
import 'package:gamemuncheol_upstream/config/theme/extension/text_style_theme.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/provider/member_provider.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/view/nickname/event/register_nickname_screen_event.dart';

class RegisterNicknameScreen extends ConsumerStatefulWidget {
  const RegisterNicknameScreen({super.key});

  static const String NAME = "CHANGE_NICKNAME_SCREEN";
  static final String PATH = "/${NAME.toLowerCase()}";

  @override
  ConsumerState<RegisterNicknameScreen> createState() =>
      _ChangeNicknameScreensState();
}

class _ChangeNicknameScreensState extends ConsumerState<RegisterNicknameScreen>
    with RegisterNicknameScreenEvent {
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: _AppBar(onLeadingTap: onLeadingTap).toPrefferedSize(),
      body: BottomButtonExpanded(
        expanded: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60.h),
              const _Header(),
              Gap(120.h),
              _NicknameFormFiled(
                nicknameController,
              ),
              Gap(15.h),
              const _ErrorInfo(),
            ],
          ),
        ),
        bottomButton: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(memberNotifierProvider);

            return SquareButton.child(
              onTap: state.isLoading
                  ? () {}
                  : () => register(nicknameController.text),
              child: state.isLoading
                  ? LoadingIndicator(
                      color: context.colors.onPrimaryBlue,
                    )
                  : Text(
                      "완료",
                      style: context.textStyles.body2M
                          .copyWith(color: context.colors.onPrimaryBlue),
                    ),
            );
          },
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final VoidCallback onLeadingTap;
  const _AppBar({required this.onLeadingTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.colors.background,
      leadingWidth: 44.w,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          child: SvgPicture.asset(
            AppAsset.CHEVRON_LEFT_BLACK,
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    const title = "롤문철에서 사용하실 닉네\n임을 입력해 주세요.";
    final titleStyle = context.textStyles.title1M;

    return Text(
      title,
      style: titleStyle,
    );
  }
}

class _NicknameFormFiled extends StatelessWidget {
  final TextEditingController nicknameController;
  const _NicknameFormFiled(this.nicknameController);

  @override
  Widget build(BuildContext context) {
    const maxLines = 1;
    const maxLength = 16;
    const hintText = "닉네임을 입력해주세요.";

    return CustomTextFormField(
      textEditingController: nicknameController,
      isUnderLineTextFormField: true,
      maxLength: maxLength,
      maxLines: maxLines,
      hintText: hintText,
    );
  }
}

class _ErrorInfo extends ConsumerWidget {
  const _ErrorInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memberNotifierProvider);

    if (state.isError) {
      return Text(
        state.error.message,
        style: context.textStyles.body5R.copyWith(
          color: context.colors.errorRed,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
