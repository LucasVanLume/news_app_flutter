import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/entities/user_entity.dart';


class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      token: '',
    );
  }
}