import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';


class NewsSavedModel extends NewsSaved {
  NewsSavedModel({
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
  });


  factory NewsSavedModel.fromNewsSaved(NewsSaved newsSaved) {//
    return NewsSavedModel(
      author: newsSaved.author,
      title: newsSaved.title,
      url: newsSaved.url,
      urlToImage: newsSaved.urlToImage,
    );
  }

  factory NewsSavedModel.fromNewsSaveModelCore(NewsSaveModelCore newsSaveModelCore) {
    return NewsSavedModel(
      author: newsSaveModelCore.author,
      title: newsSaveModelCore.title,
      url: newsSaveModelCore.url,
      urlToImage: newsSaveModelCore.urlToImage,
    );
  }

  static NewsSaveModelCore toNewsSavedModelCore(NewsSaved newsSaved) {
    return NewsSaveModelCore(
      author: newsSaved.author,
      title: newsSaved.title,
      url: newsSaved.url,
      urlToImage: newsSaved.urlToImage,
    );
  }

}
