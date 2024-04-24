import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';

abstract class SavesDbRepository {

  Future<void> deleteNews(NewsSave news);

  Future<List<NewsSave>> getSavedNews();

}
