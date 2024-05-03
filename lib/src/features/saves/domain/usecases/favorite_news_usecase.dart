import 'package:flutter_clean_architecture/core/domain/usecases/favorite_news_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/repositories/saves_db_repository.dart';


class FavoriteNewsUseCase extends FavoriteNewsUseCaseCore<NewsFavorited> {
  final SavesDbRepository savesDbRepository;

  FavoriteNewsUseCase({required this.savesDbRepository});

  @override
  Future<void> callFavoriteNewsUseCase(NewsFavorited newsFavorite) async {
    try {

      await savesDbRepository.favoriteNews(newsFavorite);

    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}