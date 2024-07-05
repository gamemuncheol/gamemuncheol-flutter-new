import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol_upstream/core/app/auth/model/sign_up_form.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/provider/member_provider.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/view/nickname/screen/register_nickname_screen.dart';

mixin RegisterNicknameScreenEvent on ConsumerState<RegisterNicknameScreen> {
  void onLeadingTap() => context.pop();

  Future<void> register(String nickname) async {
    await ref
        .read(memberNotifierProvider.notifier)
        .register(
          SignUpForm(
            temporaryKey: ref.read(authNotifierProvider).tempKey!,
            nickname: nickname.trim(),
            privacyAgree: true,
          ),
        )
        .then((success) {
      if (success) {
        context.pop();
      }
    });
  }
}
