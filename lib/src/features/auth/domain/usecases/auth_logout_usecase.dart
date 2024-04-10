import 'package:flutter_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';


class AuthLogoutUseCase {
  final AuthRepository authRepository;

  AuthLogoutUseCase({required this.authRepository});

  Future<void> callAuthLogoutUseCase() async {
    try {
      await authRepository.logout();
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}