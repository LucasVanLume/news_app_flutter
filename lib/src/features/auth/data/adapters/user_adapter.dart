import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/src/features/auth/interactor/entities/user_entity.dart';

class UserAdapter {
  static UserEntity fromFirebaseUser (User user) {
    return UserEntity(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      token: '',
    );
  }
}