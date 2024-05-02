import 'package:flutter_clean_architecture/core/data/models/news_favorite_model_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';


class NewsFavoritedModel extends NewsFavorited {
  NewsFavoritedModel({
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
  });


  factory NewsFavoritedModel.fromNewsFavorited(NewsFavorited newsFavorited) {//
    return NewsFavoritedModel(
      author: newsFavorited.author,
      title: newsFavorited.title,
      url: newsFavorited.url,
      urlToImage: newsFavorited.urlToImage,
    );
  }

  factory NewsFavoritedModel.fromNewsFavoriteModelCore(NewsFavoriteModelCore newsFavoriteModelCore) {
    return NewsFavoritedModel(
      author: newsFavoriteModelCore.author,
      title: newsFavoriteModelCore.title,
      url: newsFavoriteModelCore.url,
      urlToImage: newsFavoriteModelCore.urlToImage,
    );
  }

  static NewsFavoriteModelCore toNewsSavedModelCore(NewsFavorited newsFavorited) {
    return NewsFavoriteModelCore(
      author: newsFavorited.author,
      title: newsFavorited.title,
      url: newsFavorited.url,
      urlToImage: newsFavorited.urlToImage,
    );
  }

}