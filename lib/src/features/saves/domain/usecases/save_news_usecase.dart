import 'package:flutter_clean_architecture/core/domain/usecases/save_news_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class SaveNewsUseCase extends SaveNewsUseCaseCore<NewsSaved> {
  final SavesDbRepository savesDbRepository;

  SaveNewsUseCase({required this.savesDbRepository});

  @override
  Future<void> callSaveNewsUseCase(NewsSaved newsSave) async {
    try {

      await savesDbRepository.saveNews(newsSave);

    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}