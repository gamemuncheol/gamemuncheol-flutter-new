import 'package:injectable/injectable.dart';

import 'package:gamemuncheol_upstream/common/const/data.dart';
import 'package:gamemuncheol_upstream/core/app/auth/data/local/token_dao.dart';
import 'package:gamemuncheol_upstream/core/app/auth/data/remote/auth_repository.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/sign_up_form.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';

@lazySingleton
class AuthService {
  final TokenDao _tokenDao;
  final AuthRepository _authRepository;

  AuthService({
    required TokenDao tokenDao,
    required AuthRepository authRepository,
  })  : _tokenDao = tokenDao,
        _authRepository = authRepository;

  /**
   * 토큰 get 로직
   * 예외처리 안 함
   */
  Future<String?> getToken() async {
    return await _tokenDao.get(key: AppData.ACCESS_TOKEN_KEY);
  }

  /**
   * 임시 토큰 저장 로직
   * 예외처리 안 함
   */
  Future<void> signInTemp({required TemporaryAccessedToken token}) async {
    await _tokenDao.save(
      key: AppData.TEMP_TOKEN_KEY,
      value: token.temporaryUserKey,
    );
  }

  /**
   * 로그인 로직
   */
  Future<bool> signIn({required FullyAccessedToken token}) async {
    // 2. 새 토큰으로 덮어씀
    return _saveTokens(
            accessToken: token.accessToken, refreshToken: token.refreshToken)
        .then((value) => true);
  }

  Future<void> register(SignUpForm signUpForm) async {
    await _authRepository.register(signUpForm);
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _tokenDao.save(key: AppData.ACCESS_TOKEN_KEY, value: accessToken);
    await _tokenDao.save(key: AppData.REFRESH_TOKEN_KEY, value: refreshToken);
  }

  Future<bool> signOut() async {
    return _tokenDao.deleteAll().then((value) => true);
  }
}
