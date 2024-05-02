import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/core/data/models/news_favorite_model_core.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_favorite_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_db_repository.dart';


class HomeDbRepositoryImpl implements HomeDbRepository {
  final AppDatabaseLocal appDatabase;

  HomeDbRepositoryImpl({required this.appDatabase});

  @override
  Future<void> saveNews(NewsSave newsSave) async {
    try {
      NewsSaveModelCore newsSaveModelcore = NewsSaveModelCore.fromNewsSave(newsSave);
      await appDatabase.db.newsInsertDao.insertNewsSave(newsSaveModelcore);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<void> favoriteNews(NewsFavorite newsFavorite) async {
    try {
      NewsFavoriteModelCore newsFavoriteModelcore = NewsFavoriteModelCore.fromNewsSave(newsFavorite);
      await appDatabase.db.newsInsertDao.insertNewsFavorite(newsFavoriteModelcore);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }
}