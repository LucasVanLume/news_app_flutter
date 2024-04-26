import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';


abstract class SavesDbRepository {

  Future<void> deleteNews(NewsSaved newsSaved);

  Future<List<NewsSaved>> getSavedNews();

}
