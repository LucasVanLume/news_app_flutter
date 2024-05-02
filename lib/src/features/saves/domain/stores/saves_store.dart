import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/states/saves_state.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/delete_news_favorite_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/delete_news_save_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/get_news_favorite_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/get_news_save_usecase.dart';
import 'package:mobx/mobx.dart';


part 'saves_store.g.dart';


// ignore: library_private_types_in_public_api
class SavesStore = _SavesStoreBase with _$SavesStore;

abstract class _SavesStoreBase with Store {
  final GetNewsSaveUseCase _getNewsSaveUseCase;
  final DeleteNewsSaveUseCase _deleteNewsSaveUseCase;
  final GetNewsFavoriteUseCase _getNewsFavoriteUseCase;
  final DeleteNewsFavoriteUseCase _deleteNewsFavoriteUseCase;

  _SavesStoreBase(this._getNewsSaveUseCase, this._deleteNewsSaveUseCase, this._getNewsFavoriteUseCase, this._deleteNewsFavoriteUseCase);

  @observable
  SavesState state = const StartState();

  @observable
  List<NewsSaved>? newsSavedList;

  @observable
  List<NewsFavorited>? newsFavoritedList;

  @observable
  bool isLoading = false;

  @action
  Future<void> initSaves() async {
    isLoading = true;
    state = const LoadingState();

    try {
      final newsSaved = await _getNewsSaveUseCase.callGetNewsSaveUseCase();
      newsSavedList = newsSaved;
      final newsFavorited = await _getNewsFavoriteUseCase.callGetNewsFavoriteUseCase();
      newsFavoritedList = newsFavorited;
      state = SuccessState(newsSavedList!, newsFavoritedList!);
    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> deleteFavorites(NewsFavorited newsDelete) async {
    isLoading = true;

    try {
      await _deleteNewsFavoriteUseCase.callDeleteNewsFavoriteUseCase(newsDelete);

      final news = await _getNewsFavoriteUseCase.callGetNewsFavoriteUseCase();
      newsFavoritedList = news;

      state = SuccessState(newsSavedList!, newsFavoritedList!);

    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> deleteSaves(NewsSaved newsDelete) async {
    isLoading = true;

    try {
      await _deleteNewsSaveUseCase.callDeleteNewsSaveUseCase(newsDelete);

      final news = await _getNewsSaveUseCase.callGetNewsSaveUseCase();
      newsSavedList = news;

      state = SuccessState(newsSavedList!, newsFavoritedList!);

    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  void updateNewsList(List<NewsSaved> news) {
    newsSavedList = news;
  }

  @action
  void setState(SavesState newState) {
    state = newState;
  }

  @action
  Future<void> setIsLoading (bool boolean) async {
    isLoading = boolean;
  }

  @action
  List<NewsSaved>? getNewsList() {
    return newsSavedList;
  }
}
