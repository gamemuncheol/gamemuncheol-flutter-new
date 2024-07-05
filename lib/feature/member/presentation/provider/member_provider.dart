import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/common/model/common_response.dart';
import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_up_form.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_provider.dart';
import 'package:gamemuncheol_upstream/core/resource/base_state.dart';
import 'package:gamemuncheol_upstream/feature/member/model/member.dart';
import 'package:gamemuncheol_upstream/feature/member/service/member_service.dart';

final memberNotifierProvider =
    NotifierProvider<MemberNotifier, BaseState<Member>>(() {
  return MemberNotifier(memberService: locator<MemberService>());
});

class MemberNotifier extends Notifier<BaseState<Member>> {
  final MemberService _memberService;

  MemberNotifier({required MemberService memberService})
      : _memberService = memberService;

  @override
  BaseState<Member> build() => Initial();

  /**
   * userme
   */
  Future<void> userMe() async {
    // 1. 맴버 데이터 받아와서
    final CommonResponse<Member> user = await _memberService.me();

    // 2. 상태 업데이트
    state = Value(valueOrNull: user.data);
  }

  /**
   * 회원가입
   */
  Future<bool> register(SignUpForm signUpForm) async {
    state = Loading();

    // 1. 회원가입하고 토큰 받아옴
    final token = await _memberService.regsiter(signUpForm);

    // 2. auth 프로바이더에 토큰 넘겨주고 상태 업데이트
    return token.when(
      success: (token) async {
        await ref.read(authNotifierProvider.notifier).signIn(token: token);
        await userMe();
        return true;
      },
      failure: (err) {
        state = Error(error: err);
        return false;
      },
    );
  }
}
