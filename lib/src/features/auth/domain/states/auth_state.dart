import 'package:flutter_clean_architecture/src/features/auth/domain/entities/user_entity.dart';

sealed class AuthState {
  const AuthState();
}

class LoggedAuthState implements AuthState {
  final UserEntity user;

  const LoggedAuthState(this.user);
}

class LogoutedAuthState implements AuthState {
  const LogoutedAuthState();
}

class LoadingAuthState implements AuthState {
  const LoadingAuthState();
}