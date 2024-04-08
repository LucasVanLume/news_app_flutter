import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/models/user_model.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/services/auth_service.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';

class FirebaseAuthService implements AuthService {

  final FirebaseAuth firebaseAuth;

  FirebaseAuthService(this.firebaseAuth);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final UserCredential userCredencial = await firebaseAuth.signInWithEmailAndPassword (
        email: email,
        password: password
      );
      //String? token = await userCredencial.user?.getIdToken();
      
      final user = UserModel.fromFirebaseUser(userCredencial.user!);

      return user;
      
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
  
  @override
  UserModel getUser() {
    try {
      final user = firebaseAuth.currentUser;
      final userEntity = UserModel.fromFirebaseUser(user!);
      return userEntity;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }
  
}