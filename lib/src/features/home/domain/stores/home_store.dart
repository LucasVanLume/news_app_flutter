import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/states/home_state.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/usecases/get_news_usecase.dart';
import 'package:mobx/mobx.dart';


part 'home_store.g.dart';


// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetNewsUseCase _useCase;

  _HomeStoreBase(this._useCase);

  @observable
  HomeState state = const StartState();

  @observable
  List<News>? newsList;

  @observable
  bool isLoading = false;

  @observable
  bool isRefreshNews = false; 

  @observable
  bool isSearching = false;

  @action
  Future<void> fetchNews(isRefreshNews) async {
    isLoading = true;
    try {
      final news = await _useCase.callGetNewsUseCase(isRefreshNews);

      newsList = news;
      state = SuccessState(newsList!);

    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
      isRefreshNews = false;
    }
  }

  @action
  Future<void> init() async {
    isLoading = true;
    state = const LoadingState();

    try {
      final news = await _useCase.callGetNewsUseCase(false);
      newsList = news;
      state = SuccessState(newsList!);
    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  void updateNewsList(List<News> news) {
    newsList = news;
  }

  @action
  void setState(HomeState newState) {
    state = newState;
  }

  @action
  Future<void> setIsLoading (bool boolean) async {
    isLoading = boolean;
  }

  @action
  Future<void> setISRefreshNews (bool boolean) async {
    isRefreshNews = boolean;
  }

  @action
  Future<void> setIsSearching (bool boolean) async {
    isSearching = boolean;
  }

  @action
  List<News>? getNewsList() {
    return newsList;
  }
}
