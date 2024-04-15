import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_repository.dart';


class GetNewsUseCase {
  final HomeRepository homeRepository;
  int _page = 1;
  final int _pageSize = 6;
  List<News> _news = [];
  List<News> _newsRefresh = [];

  GetNewsUseCase({required this.homeRepository});


  Future<List<News>> callGetNewsUseCase(bool isRefreshNews) async {
    try {
      if (isRefreshNews) {
        _newsRefresh = [];
        var newsRefresh = await homeRepository.getNews(1, _pageSize);
        for (var index = 0; index < newsRefresh.length; index++) {
          var item = newsRefresh[index];
          if (item.author != null && item.source['name'] != null && item.urlToImage != null && item.publishedAt != null) {
            _newsRefresh.add(newsRefresh[index]);
          } 
        }
        if (_news[0].publishedAt != _newsRefresh[0].publishedAt) {
          _page = 2;
          _news = newsRefresh = _newsRefresh;
          return newsRefresh;
        }

        newsRefresh = _news;
        return newsRefresh;
      }

      if (_page <= 5) {
        var news = await homeRepository.getNews(_page, _pageSize);
        for (var index = 0; index < news.length; index++) {
          var item = news[index];
          if (item.author != null && item.source['name'] != null && item.urlToImage != null && item.publishedAt != null) {
            _news.add(news[index]);
          } 
        }
        _page++;
        news = _news;
        return news;
      } else {
        return _news;
      }
    } on Failure catch (e) {
      throw Exception(e);
    }
  }

}