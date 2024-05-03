import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';


abstract class SavesDbRepository {
  //Saved
  Future<void> saveNews(NewsSaved newsSave);

  Future<void> deleteNewsSaved(NewsSaved newsSaved);

  Future<List<NewsSaved>> getSavedNews();

  //Favorited
  Future<void> favoriteNews(NewsFavorited newsFavorite);

  Future<void> deleteNewsFavorited(NewsFavorited newsFavorited);

  Future<List<NewsFavorited>> getFavoritedNews();

}
