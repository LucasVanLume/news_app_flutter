import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/get_news_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/src/features/auth/data/services/firebase_auth_service.dart';
import 'package:flutter_clean_architecture/src/features/auth/interactor/stores/auth_store.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/newsApi/news_api_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/stores/home_store.dart';
import '../core/pages/splash_page.dart';
import 'package:flutter_clean_architecture/src/features/auth/ui/auth_page.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/home_page.dart';


class AppModule extends Module {

  @override
  void binds(i) {
    i.addInstance(Dio());
    i.addInstance(FirebaseAuth.instance);

    i.add(FirebaseAuthService.new);
    i.addLazySingleton(AuthStore.new);

    i.addSingleton(GetNewsUseCase.new);
    i.addSingleton<NewsDatasource>(NewsApiDatasource.new);
    i.addSingleton<HomeRepository>(HomeRepositoryImpl.new);
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/auth', child: (context) => const AuthPage(), transition: TransitionType.scale, duration: const Duration(milliseconds: 1300));
    r.child('/home', child: (context) => const HomePage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 600));

  }
}
