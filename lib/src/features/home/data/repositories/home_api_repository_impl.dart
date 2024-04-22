import 'package:flutter_clean_architecture/src/features/home/data/datasource/remote/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_api_repository.dart';


class HomeApiRepositoryImpl implements HomeApiRepository {
  final NewsDatasource datasource;

  HomeApiRepositoryImpl(this.datasource);

  @override
  Future<List<News>> getNews(page, pageSize) async {
    try {
      final list = await datasource.newsFetch(page, pageSize);
      return list;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }
}
