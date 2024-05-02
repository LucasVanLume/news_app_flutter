import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/core/data/models/news_favorite_model_core.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/data/models/news_favorited_model.dart';
import 'package:flutter_clean_architecture/src/features/saves/data/models/news_saved_model.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';

class SavesDbRepositoryImpl implements SavesDbRepository {
  final AppDatabaseLocal appDatabase;

  SavesDbRepositoryImpl({required this.appDatabase});

  @override
  Future<void> deleteNewsSaved(NewsSaved news) async {
    try {
      //NewsSavedModel newsSavedModel = NewsSavedModel.fromNewsSaved(news);
      // NewsSaveModelCore newsSaveModelCore = NewsSaveModelCore.fromNewsSaved(news);
      NewsSaveModelCore newsSaveModelCore = NewsSavedModel.toNewsSavedModelCore(news);
      return appDatabase.db.newsGetDeltDao.deleteNewsSaved(newsSaveModelCore);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<NewsSaved>> getSavedNews() async {
    try {      
      List<NewsSaveModelCore> newsSaveModelcore = await appDatabase.db.newsGetDeltDao.getAllNewsSaved();
      //List<NewsSaved> newsSaved = newsSaveModelcore.map((model) => model.toNewsSaved()).toList();
      List<NewsSaved> newsSaved = newsSaveModelcore.map((model) => NewsSavedModel.fromNewsSaveModelCore(model)).toList();
      return newsSaved;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<NewsFavorited>> getFavoritedNews() async {
    try {      
      List<NewsFavoriteModelCore> newsFavoriteModelcore = await appDatabase.db.newsGetDeltDao.getAllNewsFavorited();
      List<NewsFavorited> newsFavorited = newsFavoriteModelcore.map((model) => NewsFavoritedModel.fromNewsFavoriteModelCore(model)).toList();
      return newsFavorited;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}