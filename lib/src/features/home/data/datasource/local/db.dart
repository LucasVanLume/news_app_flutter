import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_clean_architecture/src/features/home/data/datasource/local/dao/news_dao.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';

part 'db.g.dart';

@Database(version: 1, entities: [NewsSave])
abstract class AppDatabase extends FloorDatabase {
  NewsDao get newsDao;
}