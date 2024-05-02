import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';


abstract class SavesDbRepository {

  Future<void> deleteNewsSaved(NewsSaved newsSaved);

  Future<List<NewsSaved>> getSavedNews();

  Future<List<NewsFavorited>> getFavoritedNews();

}
