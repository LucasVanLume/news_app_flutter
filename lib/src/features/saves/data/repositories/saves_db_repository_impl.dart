import 'package:flutter_clean_architecture/core/data/datasource/db.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/data/models/news_saved_model.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';

class SavesDbRepositoryImpl implements SavesDbRepository {
  final AppDatabaseLocal appDatabase;

  SavesDbRepositoryImpl({required this.appDatabase});

  @override
  Future<void> deleteNews(NewsSaved news) async {
    try {
      //NewsSavedModel newsSavedModel = NewsSavedModel.fromNewsSaved(news);
      // NewsSaveModelCore newsSaveModelCore = NewsSaveModelCore.fromNewsSaved(news);
      NewsSaveModelCore newsSaveModelCore = NewsSavedModel.toNewsSavedModelCore(news);
      return appDatabase.db.newsGetDeltDao.deleteNews(newsSaveModelCore);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<NewsSaved>> getSavedNews() async {
    try {      
      List<NewsSaveModelCore> newsSaveModelcore = await appDatabase.db.newsGetDeltDao.getAllNews();
      //List<NewsSaved> newsSaved = newsSaveModelcore.map((model) => model.toNewsSaved()).toList();
      List<NewsSaved> newsSaved = newsSaveModelcore.map((model) => NewsSavedModel.fromNewsSaveModelCore(model)).toList();
      return newsSaved;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}