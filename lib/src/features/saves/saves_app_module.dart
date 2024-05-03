import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/src/app_module.dart';
import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/src/features/saves/data/repositories/saves_db_repository_impl.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/favorite_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/save_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/delete_news_favorite_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/get_news_favorite_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/delete_news_save_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/get_news_save_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/stores/saves_store.dart';
import 'package:flutter_clean_architecture/src/features/saves/ui/saves_page.dart';


class SavesAppModule extends Module {
  late AppDatabase database;

  SavesAppModule({required this.database});

  @override
  List<Module> get imports => [
    AppModule(database: database)
  ];

  @override
  void binds(i) {
    i.addSingleton(FavoriteNewsUseCase.new);
    i.addSingleton(SaveNewsUseCase.new);
    i.addSingleton(DeleteNewsFavoriteUseCase.new);
    i.addSingleton(GetNewsFavoriteUseCase.new);
    i.addSingleton(DeleteNewsSaveUseCase.new);
    i.addSingleton(GetNewsSaveUseCase.new);
    i.addSingleton<SavesDbRepository>(SavesDbRepositoryImpl.new);
    i.addLazySingleton(SavesStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SavesPage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 500));
  }
}