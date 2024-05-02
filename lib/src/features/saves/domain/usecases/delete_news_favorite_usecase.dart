import 'package:flutter_clean_architecture/core/domain/usecases/delete_news_favorite_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class DeleteNewsFavoriteUseCase implements DeleteNewsFavoriteUseCaseCore<NewsFavorited> {
  final SavesDbRepository savesDbRepository;

  DeleteNewsFavoriteUseCase({required this.savesDbRepository});

  @override
  Future<void> callDeleteNewsFavoriteUseCase(NewsFavorited newsDelete) async {
    try {
      await savesDbRepository.deleteNewsFavorited(newsDelete);
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}