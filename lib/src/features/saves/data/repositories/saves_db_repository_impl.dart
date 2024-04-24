import 'package:flutter_clean_architecture/core/database/db.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';

class SavesDbRepositoryImpl implements SavesDbRepository {
  final AppDatabaseLocal appDatabase;

  SavesDbRepositoryImpl({required this.appDatabase});

  @override
  Future<void> deleteNews(NewsSave news) {
    try {
      print(news.title);      
      return appDatabase.db.newsDao.deleteNews(news);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<NewsSave>> getSavedNews() {
    try {      
      return appDatabase.db.newsDao.getAllNews();
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}