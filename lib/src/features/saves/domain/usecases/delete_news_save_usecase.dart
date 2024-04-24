import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class DeleteNewsSaveUseCase {
  final SavesDbRepository savesDbRepository;

  DeleteNewsSaveUseCase({required this.savesDbRepository});


  Future<void> callDeleteNewsSaveUseCase(NewsSave newsDelete) async {
    try {
      await savesDbRepository.deleteNews(newsDelete);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}