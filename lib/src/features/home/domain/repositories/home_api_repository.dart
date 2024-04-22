import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';


abstract class HomeApiRepository {
  Future<List<News>> getNews(page, pageSize);
}