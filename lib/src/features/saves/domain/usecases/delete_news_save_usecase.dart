import 'package:flutter_clean_architecture/core/domain/usecases/delete_news_save_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class DeleteNewsSaveUseCase implements DeleteNewsSaveUseCaseCore<NewsSaved> {
  final SavesDbRepository savesDbRepository;

  DeleteNewsSaveUseCase({required this.savesDbRepository});

  @override
  Future<void> callDeleteNewsSaveUseCase(NewsSaved newsDelete) async {
    try {
      await savesDbRepository.deleteNewsSaved(newsDelete);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}