import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/features/home/data/datasource/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/data/models/news_model.dart';


class NewsApiDatasource implements NewsDatasource {
  final Dio dio;
  final String apiKEY = '7af178ee26554454bfb4b666999d0638';

  // final List<NewsModel> _news = [];

  NewsApiDatasource(this.dio);

  @override
  Future<List<NewsModel>> newsFetch(page, pageSize) async {
    final url = 'https://newsapi.org/v2/top-headlines?country=us&category=business&page=$page&pageSize=$pageSize&apiKey=$apiKEY';
    var result = await dio.get(url);
    // List<NewsModel> refreshNews = [];

    if (result.statusCode == 200) {
      var resultData = result.data['articles'] as List;
      Iterable<NewsModel> news = resultData.map((json) => NewsModel.fromJson(json));

      List<NewsModel> newsList = news.toList();

      // for (var index = 0; index < newsList.length; index++) {
      //   var item = newsList[index];
      //   if (item.author != null && item.source['name'] != null && item.urlToImage != null && item.publishedAt != null) {
      //     if (page == 1) {
      //       refreshNews.add(newsList[index]);
      //     } 
      //     if (page >= 1) {
      //       _news.add(newsList[index]);  
      //     }
      //   }
      // }

      // if (page == 1) {
      //   newsList = refreshNews;
      // } else {
      //   newsList = _news;
      // }

      return newsList;
    } else {
      throw Exception();
    }
  }
}
