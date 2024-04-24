// import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/states/saves_state.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/delete_news_save_usecase.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/usecases/get_news_save_usecase.dart';
// import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
// import 'package:flutter_clean_architecture/src/features/home/domain/states/home_state.dart';
// import 'package:flutter_clean_architecture/src/features/home/domain/usecases/get_news_usecase.dart';
// import 'package:flutter_clean_architecture/src/features/home/domain/usecases/save_news_usecase.dart';
import 'package:mobx/mobx.dart';


part 'saves_store.g.dart';


// ignore: library_private_types_in_public_api
class SavesStore = _SavesStoreBase with _$SavesStore;

abstract class _SavesStoreBase with Store {
  final GetNewsSaveUseCase _getNewsSaveUseCase;
  final DeleteNewsSaveUseCase _deleteNewsSaveUseCase;

  _SavesStoreBase(this._getNewsSaveUseCase, this._deleteNewsSaveUseCase);

  @observable
  SavesState state = const StartState();

  @observable
  List<NewsSave>? newsSaveList;

  @observable
  bool isLoading = false;

  @action
  Future<void> initSaves() async {
    isLoading = true;
    state = const LoadingState();

    try {
      final news = await _getNewsSaveUseCase.callGetNewsSaveUseCase();
      newsSaveList = news;
      //print(newsSaveList);
      state = SuccessState(newsSaveList!);
    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> deleteSaves(NewsSave newsDelete) async {
    isLoading = true;

    try {
      //print(newsSaveList!.length);
      //print(newsDelete.id);
      await _deleteNewsSaveUseCase.callDeleteNewsSaveUseCase(newsDelete);

      // final news = await _getNewsSaveUseCase.callGetNewsSaveUseCase();
      // newsSaveList = news;
      // print(newsSaveList!.length);
      // //print(newsSaveList);
      // state = SuccessState(newsSaveList!);

      //state = SuccessState(newsSaveList!);
    } on Failure catch (e) {
      state = ErrorState(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  void updateNewsList(List<NewsSave> news) {
    newsSaveList = news;
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
  List<NewsSave>? getNewsList() {
    return newsSaveList;
  }
}
