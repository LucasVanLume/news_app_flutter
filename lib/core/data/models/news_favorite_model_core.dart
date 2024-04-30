import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_favorite_entity.dart';


@Entity(tableName: 'newsFavoriteTable', primaryKeys: ['title', 'author'])
class NewsFavoriteModelCore extends NewsFavorite {
  NewsFavoriteModelCore({
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
  });

  factory NewsFavoriteModelCore.fromNewsSave(NewsFavorite newsFavorite) {
    return NewsFavoriteModelCore(
      author: newsFavorite.author,
      title: newsFavorite.title,
      url: newsFavorite.url,
      urlToImage: newsFavorite.urlToImage,
    );
  }

}
