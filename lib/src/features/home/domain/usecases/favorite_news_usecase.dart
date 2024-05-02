import 'package:flutter_clean_architecture/core/domain/usecases/favorite_news_usecase_core.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_favorite_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_db_repository.dart';


class FavoriteNewsUseCase extends FavoriteNewsUseCaseCore<NewsFavorite> {
  final HomeDbRepository homeDbRepository;

  FavoriteNewsUseCase({required this.homeDbRepository});

  @override
  Future<void> callFavoriteNewsUseCase(NewsFavorite newsFavorite) async {
    try {

      await homeDbRepository.favoriteNews(newsFavorite);

    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}