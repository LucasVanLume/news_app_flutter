import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/data/models/news_model.dart';


class NewsApiDatasource implements NewsDatasource {
  final Dio dio;
  final String apiKEY = '7af178ee26554454bfb4b666999d0638';

  NewsApiDatasource(this.dio);

  @override
  Future<List<NewsModel>> newsFetch() async {
    //const url = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7af178ee26554454bfb4b666999d0638';
    final url = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKEY';
    var result = await dio.get(url);
    if (result.statusCode == 200) {
      var resultData = result.data['articles'] as List;
      //List <NewsModel> news = resultData.map((json) => NewsModel.fromJson(json)).toList();
      Iterable<NewsModel> news = resultData.map((json) => NewsModel.fromJson(json));
      
      List<NewsModel> newsList = news.toList();

      return newsList;
    } else {
      throw Exception();
    }
  }
}
