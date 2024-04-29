import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/src/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/services/firebase/firebase_auth_service.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/services/auth_service.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/usecases/auth_login_usecase.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/usecases/auth_logout_usecase.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/stores/auth_store.dart';
import 'package:flutter_clean_architecture/src/features/auth/ui/auth_page.dart';


class AuthAppModule extends Module {
  late AppDatabase database;

  AuthAppModule({required this.database});

  @override
  List<Module> get imports => [
    AppModule(database: database)
  ];

  @override
  void binds(i) {
    i.addLazySingleton(AuthStore.new);
    i.addSingleton(AuthLogoutUseCase.new);
    i.addSingleton(AuthLoginUseCase.new);
    i.addSingleton<AuthRepository>(FirebaseAuthRepository.new);
    i.addSingleton<AuthService>(FirebaseAuthService.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AuthPage(), transition: TransitionType.scale, duration: const Duration(milliseconds: 1300));
  }
}
