// ignore_for_file: constant_identifier_names

import 'package:gamemuncheol_upstream/core/resource/base_error.dart';

enum MemberError implements BaseError {
  // 닉네임 중복
  DUPLICATED_NICKNAME("이미 사용중인 닉네임입니다."),

  // 회원가입 실패
  REGISTER_FAILED("회원가입 실패, 잠시후 다시 시도해 주세요.");

  const MemberError(this.message);

  @override
  final String message;
}
