import 'package:flutter_clean_architecture/src/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/remote/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/remote/newsApi/news_api_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/home_api_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/data/repositories/home_db_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_api_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_db_repository.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/get_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/save_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/stores/home_store.dart';
import 'package:flutter_clean_architecture/src/features/home/ui/home_page.dart';


class HomeAppModule extends Module {
  late AppDatabase database;

  HomeAppModule({required this.database});

  @override
  List<Module> get imports => [
    AppModule(database: database),
  ];

  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
    i.addSingleton<HomeDbRepository>(HomeDbRepositoryImpl.new);
    i.addSingleton(SaveNewsUseCase.new); 
    i.addSingleton<HomeApiRepository>(HomeApiRepositoryImpl.new);
    i.addSingleton(GetNewsUseCase.new);
    i.addSingleton(AppDatabaseLocal.new);
    i.addSingleton<NewsDatasource>(NewsApiDatasource.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 500));
  }
}