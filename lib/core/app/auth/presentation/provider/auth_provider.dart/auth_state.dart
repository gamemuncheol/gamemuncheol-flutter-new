enum AuthStates {
  unknown,
  temporary,
  authenticated,
  unAuthenticated;
}

class AuthState {
  final AuthStates authStates;
  final String? tempKey;

  AuthState(this.authStates, {this.tempKey});

  AuthState copyWith({
    AuthStates? authStates,
    String? tempKey,
  }) {
    return AuthState(
      authStates ?? this.authStates,
      tempKey: tempKey ?? this.tempKey,
    );
  }
}
