import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/core/resource/result.dart';
import 'package:gamemuncheol_upstream/feature/member/service/member_service.dart';

part 'change_nickname_provider.g.dart';

@riverpod
class ChangeNicknameNotifier extends _$ChangeNicknameNotifier {
  @override
  BaseState<void> build() => Initial();

  Future<bool> changeNickname(String nickname) async {
    state = Loading(message: "닉네임 변경 중..");

    final Result<bool> resp =
        await locator<MemberService>().changeNickname(nickname);

    return resp.when(
      success: (success) {
        state = Value();
        return true;
      },
      failure: (e) {
        state = Error(error: e);
        return false;
      },
    );
  }
}
