import 'package:flutter_clean_architecture/core/modules/main_app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/core/configs/language/app_settings_language.dart';
import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_app_module.dart';
import 'package:flutter_clean_architecture/src/features/home/home_app_module.dart';
import 'package:flutter_clean_architecture/src/features/saves/saves_app_module.dart';
import '../core/pages/splash_page.dart';


class AppModule extends Module {
  late AppDatabase database;

  AppModule({required this.database});

  @override
  void binds(i) {

    i.addInstance(Dio());
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(database);
    
    i.addSingleton(AppSettingsLanguage.new);

    i.addSingleton(AppDatabaseLocal.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/main', module: MainAppModule(database: database));
    r.module('/auth', module: AuthAppModule(database: database));
    r.module('/home', module: HomeAppModule(database: database));
    r.module('/saves', module: SavesAppModule(database: database));
  }
}
