import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/core/data/models/news_favorite_model_core.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';


@dao
abstract class NewsInsertDao {
  
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewsSave(NewsSaveModelCore newsSave);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewsFavorite(NewsFavoriteModelCore newsFavorite);

}