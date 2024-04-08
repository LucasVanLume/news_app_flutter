import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
//import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_repository.dart';
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

  @action
  Future<void> fetchNews() async {
    isLoading = true;
    state = const LoadingState();

    try {
      final news = await _useCase.callGetNewsUseCase();
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
}

// import 'package:async/async.dart';
// import 'package:mobx/mobx.dart';

// import '../repositories/search_repository.dart';
// import '../states/search_state.dart';

// part 'search_store.g.dart';

// class SearchStore = _SearchStoreBase with _$SearchStore;

// abstract class _SearchStoreBase with Store {
//   final SearchRepository repository;
//   CancelableOperation? cancellableOperation;

//   _SearchStoreBase(this.repository) {////
//     reaction((_) => searchText, (text) async {
//       stateReaction(text, cancellableOperation);
//     }, delay: 500);
//   }

//   Future stateReaction(String text, [CancelableOperation? cancellableOperation]) async {
//     await cancellableOperation?.cancel();
//     cancellableOperation = CancelableOperation<SearchState>.fromFuture(repository.getUsers(text));

//     if (text.isEmpty) {
//       setState(StartState());
//       return;
//     }

//     setState(LoadingState());

//     setState(await cancellableOperation.valueOrCancellation(LoadingState()));
//   }

//   @observable
//   String searchText = "";

//   @observable
//   SearchState state = StartState();

//   @action
//   setSearchText(String value) => searchText = value;

//   @action
//   setState(SearchState value) => state = value;
// }