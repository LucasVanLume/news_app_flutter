import 'package:flutter_clean_architecture/core/domain/usecases/get_news_favorite_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class GetNewsFavoriteUseCase implements GetNewsFavoriteUseCaseCore<List<NewsFavorited>> {
  final SavesDbRepository savesDbRepository;

  GetNewsFavoriteUseCase({required this.savesDbRepository});

  @override
  Future<List<NewsFavorited>> callGetNewsFavoriteUseCase() async {
    try {
      var news = await savesDbRepository.getFavoritedNews();
      return news;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}