import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_app_module.dart';
import 'package:flutter_clean_architecture/src/features/home/home_app_module.dart';
import 'package:flutter_clean_architecture/src/features/saves/saves_app_module.dart';
import 'package:flutter_clean_architecture/core/main_page.dart';


class MainAppModule extends Module {
  late AppDatabase database;

  MainAppModule({required this.database});

  @override
  List<Module> get imports => [
    AuthAppModule(database: database),
    HomeAppModule(database: database),
    SavesAppModule(database: database),
  ];

  @override
  void binds(i) {

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MainPage(), transition: TransitionType.leftToRight, duration: const Duration(milliseconds: 500));
  }
}