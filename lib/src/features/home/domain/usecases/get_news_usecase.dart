import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_repository.dart';


class GetNewsUseCase {
  final HomeRepository homeRepository;

  GetNewsUseCase({required this.homeRepository});

  Future<List<News>> callGetNewsUseCase() async {
    try {
      final news = await homeRepository.getNews();
      return news;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}