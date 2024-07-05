import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol_upstream/config/di/di_setup_passive.dart';
import 'package:gamemuncheol_upstream/core/app/auth/model/token_response.dart';
import 'package:gamemuncheol_upstream/core/app/auth/presentation/provider/auth_provider.dart/auth_state.dart';
import 'package:gamemuncheol_upstream/core/app/auth/service/auth_service.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier(authService: locator<AuthService>());
});

class AuthNotifier extends Notifier<AuthState> {
  final AuthService _authService;

  AuthNotifier({required AuthService authService}) : _authService = authService;

  @override
  AuthState build() {
    return AuthState(AuthStates.unknown);
  }

  /**
   * 유저 auth 정보 확인
   */
  Future<bool> init() async {
    // 1. 토큰 체크
    if (await _authService.getToken() == null) {
      // 2. 토큰 없으면 로그아웃 상태로 업데이트
      state = state.copyWith(authStates: AuthStates.unAuthenticated);
      return false;
    }

    // 3. 토큰 있으면 로그인 상태로 업데이트
    state = state.copyWith(authStates: AuthStates.authenticated);
    return true;
  }

  /**
   * 임시 로그인
   */
  Future<void> signInTemp({
    required TemporaryAccessedToken token,
  }) async {
    // 1. 임시 토큰 저장
    await _authService.signInTemp(token: token);

    // 2. 임시 로그인 상태로 업데이트
    state = state.copyWith(
        authStates: AuthStates.temporary, tempKey: token.temporaryUserKey);
  }

  /**
   * 로그인
   */
  Future<void> signIn({
    required FullyAccessedToken token,
  }) async {
    // 1. 토큰 저장
    await _authService.signIn(token: token);

    // 2. 로그인 상태로 업데이트
    state = state.copyWith(authStates: AuthStates.authenticated, tempKey: null);
  }

  /**
   * 로그아웃
   */
  Future<void> signOut() async {
    //
    // 1. 토큰 삭제
    await _authService.signOut();

    // 2. 로그아웃 상태로 업데이트
    state = state.copyWith(authStates: AuthStates.unAuthenticated);
  }
}
