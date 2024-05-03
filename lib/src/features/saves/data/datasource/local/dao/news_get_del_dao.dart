import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/core/data/models/news_favorite_model_core.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';


@dao
abstract class NewsGetDeltDao {
  //Saved
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewsSave(NewsSaveModelCore newsSave);

  @delete
  Future<void> deleteNewsSaved(NewsSaveModelCore newsSaved);

  @Query('SELECT * FROM newsTable') //SELECT * FROM newsTable ORDER BY id DESC
  Future<List<NewsSaveModelCore>> getAllNewsSaved();

  //Favorited
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewsFavorite(NewsFavoriteModelCore newsFavorite);

  @delete
  Future<void> deleteNewsFavorited(NewsFavoriteModelCore newsFavorited);

  @Query('SELECT * FROM newsFavoriteTable')
  Future<List<NewsFavoriteModelCore>> getAllNewsFavorited();
}