import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
//import 'package:flutter_clean_architecture/src/features/home/domain/states/home_state.dart';

abstract class HomeRepository {
  Future<List<News>> getNews();
}