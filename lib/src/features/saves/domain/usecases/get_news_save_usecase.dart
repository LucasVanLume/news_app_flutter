import 'package:flutter_clean_architecture/core/domain/usecases/get_news_save_core_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class GetNewsSaveUseCase implements GetNewsSaveUseCaseCore<List<NewsSaved>> {
  final SavesDbRepository savesDbRepository;

  GetNewsSaveUseCase({required this.savesDbRepository});

  @override
  Future<List<NewsSaved>> callGetNewsSaveUseCase() async {
    try {
      var news = await savesDbRepository.getSavedNews();
      return news;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}