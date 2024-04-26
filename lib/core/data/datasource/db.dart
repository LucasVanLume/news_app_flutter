import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/local/dao/news_dao.dart';
import 'package:flutter_clean_architecture/src/features/saves/data/datasource/local/dao/news_get_del_dao.dart';


part 'db.g.dart';


class AppDatabaseLocal extends _$AppDatabase {
  AppDatabase db;
  AppDatabaseLocal({required this.db});

  static Future<AppDatabase> initialize() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  }
}


@Database(version: 1, entities: [NewsSaveModelCore])
abstract class AppDatabase extends FloorDatabase {
  NewsInsertDao get newsInsertDao;
  NewsGetDeltDao get newsGetDeltDao;
}