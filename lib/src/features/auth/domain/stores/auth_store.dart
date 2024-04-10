import 'package:flutter_clean_architecture/src/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/states/auth_state.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/usecases/auth_login_usecase.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/usecases/auth_logout_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  //final FirebaseAuthRepository firebaseAuthRepository;
  final AuthLoginUseCase loginUseCase;
  final AuthLogoutUseCase logoutUseCase;

  _AuthStoreBase(this.loginUseCase, this.logoutUseCase);

  @observable
  AuthState _authState = const LogoutedAuthState();

  @observable
  UserEntity? _userEntity;

  @observable
  bool isLoading = false;

  @action
  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    _authState = const LoadingAuthState();
    try{
      _userEntity = await loginUseCase.callAuthLoginUseCase(email: email, password: password);
      _authState = LoggedAuthState(_userEntity!);
    } on Failure {
      _authState = const LogoutedAuthState();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    isLoading = true;
    _authState = const LoadingAuthState();
    try {
      await logoutUseCase.callAuthLogoutUseCase();
      _authState = const LogoutedAuthState();
    } on Failure {
      _authState = LoggedAuthState(_userEntity!);
    } finally {
      isLoading = false;
    }
  }

  UserEntity? get userEntity => (_authState is LoggedAuthState) ? (_authState as LoggedAuthState).user : null;
  AuthState get authState => _authState;
}
