import 'package:flutter_clean_architecture/src/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password});
  Future<void> logout();
}