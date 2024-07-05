enum Policys {
  AGE_POLICY("[필수] 만 14세 이상입니다.", true),
  SERVICE_POLICY("[필수] 서비스 이용약관 동의", true),
  PRIVACY_POLICY("[필수] 개인정보 처리방침 동의", true),
  MARKETING_POLICY("[선택] 마케팅 수신 동의", false),
  COMMUNITY_POLICY("[선택] 커뮤니티 이용 방침 동의", false);

  final String title;
  final bool isNecessary;

  const Policys(this.title, this.isNecessary);
}
