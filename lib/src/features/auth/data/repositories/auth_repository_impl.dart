import 'package:flutter_clean_architecture/src/features/auth/data/services/auth_service.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';


class FirebaseAuthRepository implements AuthRepository {
  final AuthService authService;

  FirebaseAuthRepository(this.authService);

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    final user = await authService.login(email, password);
    return user;
    //String? token = await user.getIdToken();
  }

  @override
  Future<void> logout() async {
    await authService.logout();
  }
}