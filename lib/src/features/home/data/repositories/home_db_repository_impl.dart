import 'package:flutter_clean_architecture/core/database/db.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_db_repository.dart';


class HomeDbRepositoryImpl implements HomeDbRepository {
  final AppDatabaseLocal appDatabase;

  HomeDbRepositoryImpl({required this.appDatabase});

  @override
  Future<void> saveNews(NewsSave news) async {
    try {      
      return appDatabase.db.newsDao.insertNews(news);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }
}