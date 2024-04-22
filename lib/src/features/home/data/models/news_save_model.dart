import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';


class NewsSaveModel extends NewsSave {
  NewsSaveModel({
    super.id,
    //required super.idxNews,
    //required super.source,
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
  });
}