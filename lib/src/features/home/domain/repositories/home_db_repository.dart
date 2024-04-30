import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_favorite_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';

abstract class HomeDbRepository {

  Future<void> saveNews(NewsSave newsSave);

  Future<void> favoriteNews(NewsFavorite newsFavorite);

}
