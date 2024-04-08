import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/src/features/auth/interactor/entities/user_entity.dart';


abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password});
  Future<void> logout();
}

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User user = userCredential.user!;
    String? token = await user.getIdToken();
    return UserEntity(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email!,
      token: token ?? '',
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}