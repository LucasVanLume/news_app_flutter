import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/states/saves_state.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/favorite_news_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/save_news_usecase.dart';
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
  final SaveNewsUseCase _saveNewsUseCase;
  final FavoriteNewsUseCase _favoriteNewsUseCase;

  _SavesStoreBase(
      this._getNewsSaveUseCase,
      this._deleteNewsSaveUseCase,
      this._getNewsFavoriteUseCase,
      this._deleteNewsFavoriteUseCase,
      this._saveNewsUseCase,
      this._favoriteNewsUseCase);

  @observable
  SavesState state = const StartState();

  @observable
  List<NewsSaved>? newsSavedList;

  @observable
  List<NewsFavorited>? newsFavoritedList;

  @observable
  NewsSaved? newsSaved;

  @observable
  NewsFavorited? newsFavorited;

  @observable
  bool isLoading = false;

  @observable
  bool isAtSaves = true;

  @observable
  bool isAtFavorites = false;

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
  Future<void> saveNews(NewsSaved newsSaving) async {
    isLoading = true;

    try {
      newsSaved = newsSaving;
      await _saveNewsUseCase.callSaveNewsUseCase(newsSaved!);
      // newsSavedList!.add(newsSaved!);

      // SuccessState(newsSavedList!, newsFavoritedList!);
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
  Future<void> favoriteNews(NewsFavorited newsFavoriting) async {
    isLoading = true;

    try {
      newsFavorited = newsFavoriting;
      await _favoriteNewsUseCase.callFavoriteNewsUseCase(newsFavorited!);
      // newsSavedList!.add(newsSaved!);

      // SuccessState(newsSavedList!, newsFavoritedList!);
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
  void updateNewsSavedList(List<NewsSaved> news) {
    newsSavedList = news;
  }

  @action
  void updateNewsFavoritedList(List<NewsFavorited> news) {
    newsFavoritedList = news;
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
  Future<void> setAtSavesOrAtFavorites (bool atSaves, bool atFavorites) async {
    isAtSaves = atSaves;
    isAtFavorites = atFavorites;
  }

  @action
  List<NewsSaved>? getNewsSavedList() {
    return newsSavedList;
  }

  @action
  List<NewsFavorited>? getNewsFavoritedList() {
    return newsFavoritedList;
  }
}
