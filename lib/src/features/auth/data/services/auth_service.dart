import 'package:flutter_clean_architecture/src/features/auth/data/models/user_model.dart';


abstract class AuthService {
  Future<UserModel> login(String email, String password);

  Future<void> logout();

  UserModel getUser();
}

