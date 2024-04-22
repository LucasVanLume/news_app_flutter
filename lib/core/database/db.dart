import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_clean_architecture/core/database/dao/news_dao.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';

part 'db.g.dart';

class AppDatabaseLocal extends _$AppDatabase {
  AppDatabase db;
  AppDatabaseLocal({required this.db});

  static Future<AppDatabase> initialize() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  }
}


@Database(version: 1, entities: [NewsSave])
abstract class AppDatabase extends FloorDatabase {
  NewsDao get newsDao;
}