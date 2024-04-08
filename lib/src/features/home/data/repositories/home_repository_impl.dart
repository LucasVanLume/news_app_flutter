import 'package:flutter_clean_architecture/src/features/home/data/datasource/news_datasource.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_entity.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/errors/home_error.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/repositories/home_repository.dart';
//import 'package:flutter_clean_architecture/src/features/home/domain/states/home_state.dart';


class HomeRepositoryImpl implements HomeRepository {
  final NewsDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<List<News>> getNews() async {
    try {
      final list = await datasource.newsFetch();
      return list;
    } on Failure catch (e) {
      throw Exception(e);
    }
  }
}



// class HomeRepositoryImpl implements HomeRepository {
//   final NewsDatasource datasource;

//   HomeRepositoryImpl(this.datasource);

//   @override
//   Future<HomeState> getNews() async {
//     try {
//       final list = await datasource.newsFetch();
//       return SuccessState(list);
//     } catch (e) {
//       return ErrorState(ErrorNews());
//     }
//   }
// }



// import 'package:clean_dart_github_search_mobx/app/search/data/datasources/search_datasource.dart';
// import 'package:clean_dart_github_search_mobx/app/search/interactor/errors/erros.dart';
// import 'package:clean_dart_github_search_mobx/app/search/interactor/repositories/search_repository.dart';

// import '../../interactor/states/search_state.dart';

// class SearchRepositoryImpl implements SearchRepository {
//   final SearchDatasource datasource;

//   SearchRepositoryImpl(this.datasource);

//   @override
//   Future<SearchState> getUsers(String searchText) async {
//     try {
//       final list = await datasource.searchText(searchText);
//       return SuccessState(list);
//     } catch (e) {
//       return ErrorState(ErrorSearch());
//     }
//   }
// }