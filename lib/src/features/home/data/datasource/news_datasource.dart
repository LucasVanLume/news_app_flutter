import 'package:flutter_clean_architecture/src/features/home/data/models/news_model.dart';

abstract class NewsDatasource {
  Future<List<NewsModel>> newsFetch(int page, int pageSize);
}