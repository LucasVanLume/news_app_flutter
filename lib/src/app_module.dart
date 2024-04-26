import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/configs/language/app_settings_language.dart';
import 'package:flutter_clean_architecture/core/main_page.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/services/auth_service.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/usecases/auth_login_usecase.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/usecases/auth_logout_usecase.dart';
import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/home_db_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_db_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/get_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/save_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/data/repositories/saves_db_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/delete_news_save_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/get_news_save_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/saves_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/services/firebase/firebase_auth_service.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/stores/auth_store.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/remote/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/remote/newsApi/news_api_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_api_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/home_api_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/stores/home_store.dart';
import '../core/pages/splash_page.dart';
import 'package:flutter_clean_architecture/src/features/auth/ui/auth_page.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/home_page.dart';


class AppModule extends Module {
  late AppDatabase database;

  AppModule({required this.database});

  @override
  void binds(i) {

    i.addInstance(Dio());
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(database);

    i.addSingleton(AuthLogoutUseCase.new);
    i.addSingleton(AuthLoginUseCase.new);
    i.addSingleton<AuthService>(FirebaseAuthService.new);
    i.addSingleton<AuthRepository>(FirebaseAuthRepository.new);
    i.addLazySingleton(AuthStore.new);

    i.addSingleton(AppDatabaseLocal.new);
    i.addSingleton(SaveNewsUseCase.new);
    i.addSingleton<HomeDbRepository>(HomeDbRepositoryImpl.new);
    i.addLazySingleton(HomeStore.new);
    i.addSingleton(GetNewsUseCase.new); 
    i.addSingleton<NewsDatasource>(NewsApiDatasource.new);
    i.addSingleton<HomeApiRepository>(HomeApiRepositoryImpl.new);

    i.addSingleton(DeleteNewsSaveUseCase.new);
    i.addSingleton(GetNewsSaveUseCase.new);
    i.addSingleton<SavesDbRepository>(SavesDbRepositoryImpl.new);
    i.addLazySingleton(SavesStore.new);
    
    i.addSingleton(AppSettingsLanguage.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/auth', child: (context) => const AuthPage(), transition: TransitionType.scale, duration: const Duration(milliseconds: 1300));
    r.child('/main', child: (context) => const MainPage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 500));
    r.child('/home', child: (context) => const HomePage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 500));
    r.child('/saves', child: (context) => const SavesPage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 500));

  }
}
