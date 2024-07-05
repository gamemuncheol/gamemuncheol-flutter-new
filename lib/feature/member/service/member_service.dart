import 'package:injectable/injectable.dart';

import 'package:gamemuncheol_upstream/common/model/common_response.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_up_form.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';
import 'package:gamemuncheol_upstream/core/resource/base_error.dart';
import 'package:gamemuncheol_upstream/core/resource/result.dart';
import 'package:gamemuncheol_upstream/feature/member/data/remote/member_repository.dart';
import 'package:gamemuncheol_upstream/feature/member/model/member.dart';
import 'package:gamemuncheol_upstream/feature/member/model/member_error.dart';

@lazySingleton
class MemberService {
  final MemberRepository _memberRepository;

  MemberService({
    required MemberRepository memberRepository,
  }) : _memberRepository = memberRepository;

  /**
   * 회원가입 로직
   * 회원가입에 닉네임 설정이랑 콜래보레이션 있어서 미리 중복을 확인해야 함!
   */
  Future<Result<FullyAccessedToken>> regsiter(SignUpForm signUpForm) async {
    try {
      // 1. 중복 시
      if (await _checkDuplicatedNickname(signUpForm.nickname)) {
        return const Failure(
          MemberError.DUPLICATED_NICKNAME,
        );
      }

      // 2. 중복 아니면 회원가입
      return Success(
        (await _memberRepository.register(signUpForm)).data!,
      );
    } catch (e) {
      return const Failure(
        MemberError.REGISTER_FAILED,
      );
    }
  }

  /**
   * 닉네임 변경 로직
   */
  Future<Result<bool>> changeNickname(String nickname) async {
    try {
      // 1. 중복 시
      if (await _checkDuplicatedNickname(nickname)) {
        return const Failure(
          MemberError.DUPLICATED_NICKNAME,
        );
      }

      // 2. 중복 아니면 닉네임 변경
      return Success(
        (await _memberRepository.changeNickname(nickname)).success,
      );
    } catch (e) {
      return const Failure(
        CommonError.UN_KNOWN,
      );
    }
  }

  /**
   * 닉네임 중복 확인 로직 
   */
  Future<bool> _checkDuplicatedNickname(String nickname) async {
    return (await _memberRepository.checkDuplicatedNickname(nickname)).data!;
  }

  /**
   * userme 로직 
   * 이런 건 예외처리 해도 의미가 없어서 예외처리 X
   */
  Future<CommonResponse<Member>> me() async {
    return await _memberRepository.me();
  }
}
