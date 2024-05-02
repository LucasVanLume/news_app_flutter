import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';


@Entity(tableName: 'newsTable', primaryKeys: ['title', 'author'])
class NewsSaveModelCore extends NewsSave {
  NewsSaveModelCore({
    required super.author,
    required super.title,
    required super.url,
    required super.urlToImage,
  });

  factory NewsSaveModelCore.fromNewsSave(NewsSave newsSave) {
    return NewsSaveModelCore(
      author: newsSave.author,
      title: newsSave.title,
      url: newsSave.url,
      urlToImage: newsSave.urlToImage,
    );
  }

}
