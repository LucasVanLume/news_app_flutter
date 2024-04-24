import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class GetNewsSaveUseCase {
  final SavesDbRepository savesDbRepository;

  GetNewsSaveUseCase({required this.savesDbRepository});


  Future<List<NewsSave>> callGetNewsSaveUseCase() async {
    try {
      var news = await savesDbRepository.getSavedNews();
      return news;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}