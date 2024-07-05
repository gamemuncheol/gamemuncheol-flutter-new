import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_state.dart';
import 'package:gamemuncheol_upstream/feature/member/presentation/provider/member_provider.dart';

part 'role_method.g.dart';

@riverpod
void excecuteWhen(
  ExcecuteWhenRef ref, {
  required Function user,
  required Function guest,
}) {
  final bool authenticated =
      ref.read(authNotifierProvider).authStates == AuthStates.authenticated;

  if (authenticated) {
    final bState = ref.read(memberNotifierProvider);

    // 개인정보처리방침 동의 유저
    if (bState.hasValue) {
      user();
      return;
    }
  }
  // 개인정보처리방침 미동의 유저
  guest();
}
