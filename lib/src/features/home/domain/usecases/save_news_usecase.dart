import 'package:flutter_clean_architecture/core/domain/usecases/save_news_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_db_repository.dart';


class SaveNewsUseCase extends SaveNewsUseCaseCore<NewsSave> {
  final HomeDbRepository homeDbRepository;

  SaveNewsUseCase({required this.homeDbRepository});

  @override
  Future<void> callSaveNewsUseCase(NewsSave newsSave) async {
    try {

      await homeDbRepository.saveNews(newsSave);

    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}