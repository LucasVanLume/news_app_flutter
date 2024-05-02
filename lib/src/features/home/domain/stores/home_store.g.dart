// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$stateAtom = Atom(name: '_HomeStoreBase.state', context: context);

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$newsListAtom =
      Atom(name: '_HomeStoreBase.newsList', context: context);

  @override
  List<News>? get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(List<News>? value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  late final _$newsSaveAtom =
      Atom(name: '_HomeStoreBase.newsSave', context: context);

  @override
  NewsSave? get newsSave {
    _$newsSaveAtom.reportRead();
    return super.newsSave;
  }

  @override
  set newsSave(NewsSave? value) {
    _$newsSaveAtom.reportWrite(value, super.newsSave, () {
      super.newsSave = value;
    });
  }

  late final _$newsFavoriteAtom =
      Atom(name: '_HomeStoreBase.newsFavorite', context: context);

  @override
  NewsFavorite? get newsFavorite {
    _$newsFavoriteAtom.reportRead();
    return super.newsFavorite;
  }

  @override
  set newsFavorite(NewsFavorite? value) {
    _$newsFavoriteAtom.reportWrite(value, super.newsFavorite, () {
      super.newsFavorite = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isRefreshNewsAtom =
      Atom(name: '_HomeStoreBase.isRefreshNews', context: context);

  @override
  bool get isRefreshNews {
    _$isRefreshNewsAtom.reportRead();
    return super.isRefreshNews;
  }

  @override
  set isRefreshNews(bool value) {
    _$isRefreshNewsAtom.reportWrite(value, super.isRefreshNews, () {
      super.isRefreshNews = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: '_HomeStoreBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$favoriteNewsAsyncAction =
      AsyncAction('_HomeStoreBase.favoriteNews', context: context);

  @override
  Future<void> favoriteNews(NewsFavorite newsfavoriting) {
    return _$favoriteNewsAsyncAction
        .run(() => super.favoriteNews(newsfavoriting));
  }

  late final _$saveNewsAsyncAction =
      AsyncAction('_HomeStoreBase.saveNews', context: context);

  @override
  Future<void> saveNews(NewsSave newsSaving) {
    return _$saveNewsAsyncAction.run(() => super.saveNews(newsSaving));
  }

  late final _$fetchNewsAsyncAction =
      AsyncAction('_HomeStoreBase.fetchNews', context: context);

  @override
  Future<void> fetchNews(dynamic isRefreshNews) {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews(isRefreshNews));
  }

  late final _$initAsyncAction =
      AsyncAction('_HomeStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_HomeStoreBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool boolean) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(boolean));
  }

  late final _$setISRefreshNewsAsyncAction =
      AsyncAction('_HomeStoreBase.setISRefreshNews', context: context);

  @override
  Future<void> setISRefreshNews(bool boolean) {
    return _$setISRefreshNewsAsyncAction
        .run(() => super.setISRefreshNews(boolean));
  }

  late final _$setIsSearchingAsyncAction =
      AsyncAction('_HomeStoreBase.setIsSearching', context: context);

  @override
  Future<void> setIsSearching(bool boolean) {
    return _$setIsSearchingAsyncAction.run(() => super.setIsSearching(boolean));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void updateNewsList(List<News> news) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateNewsList');
    try {
      return super.updateNewsList(news);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(HomeState newState) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setState');
    try {
      return super.setState(newState);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<News>? getNewsList() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.getNewsList');
    try {
      return super.getNewsList();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
newsList: ${newsList},
newsSave: ${newsSave},
newsFavorite: ${newsFavorite},
isLoading: ${isLoading},
isRefreshNews: ${isRefreshNews},
isSearching: ${isSearching}
    ''';
  }
}
