import 'package:flutter_clean_architecture/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';

class AuthLoginUseCase {
  final AuthRepository authRepository;

  AuthLoginUseCase({required this.authRepository});

  Future<UserEntity> callAuthLoginUseCase({required String email, required String password}) async {
    try {
      final userLogin = await authRepository.login(email: email, password: password);
      return userLogin;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}