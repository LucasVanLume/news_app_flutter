import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';


@dao
abstract class NewsGetDeltDao {
  @delete
  Future<void> deleteNews(NewsSaveModelCore news);

  @Query('SELECT * FROM newsTable') //SELECT * FROM newsTable ORDER BY id DESC
  Future<List<NewsSaveModelCore>> getAllNews();
}