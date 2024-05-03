// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saves_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SavesStore on _SavesStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_SavesStoreBase.state', context: context);

  @override
  SavesState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SavesState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$newsSavedListAtom =
      Atom(name: '_SavesStoreBase.newsSavedList', context: context);

  @override
  List<NewsSaved>? get newsSavedList {
    _$newsSavedListAtom.reportRead();
    return super.newsSavedList;
  }

  @override
  set newsSavedList(List<NewsSaved>? value) {
    _$newsSavedListAtom.reportWrite(value, super.newsSavedList, () {
      super.newsSavedList = value;
    });
  }

  late final _$newsFavoritedListAtom =
      Atom(name: '_SavesStoreBase.newsFavoritedList', context: context);

  @override
  List<NewsFavorited>? get newsFavoritedList {
    _$newsFavoritedListAtom.reportRead();
    return super.newsFavoritedList;
  }

  @override
  set newsFavoritedList(List<NewsFavorited>? value) {
    _$newsFavoritedListAtom.reportWrite(value, super.newsFavoritedList, () {
      super.newsFavoritedList = value;
    });
  }

  late final _$newsSavedAtom =
      Atom(name: '_SavesStoreBase.newsSaved', context: context);

  @override
  NewsSaved? get newsSaved {
    _$newsSavedAtom.reportRead();
    return super.newsSaved;
  }

  @override
  set newsSaved(NewsSaved? value) {
    _$newsSavedAtom.reportWrite(value, super.newsSaved, () {
      super.newsSaved = value;
    });
  }

  late final _$newsFavoritedAtom =
      Atom(name: '_SavesStoreBase.newsFavorited', context: context);

  @override
  NewsFavorited? get newsFavorited {
    _$newsFavoritedAtom.reportRead();
    return super.newsFavorited;
  }

  @override
  set newsFavorited(NewsFavorited? value) {
    _$newsFavoritedAtom.reportWrite(value, super.newsFavorited, () {
      super.newsFavorited = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SavesStoreBase.isLoading', context: context);

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

  late final _$isAtSavesAtom =
      Atom(name: '_SavesStoreBase.isAtSaves', context: context);

  @override
  bool get isAtSaves {
    _$isAtSavesAtom.reportRead();
    return super.isAtSaves;
  }

  @override
  set isAtSaves(bool value) {
    _$isAtSavesAtom.reportWrite(value, super.isAtSaves, () {
      super.isAtSaves = value;
    });
  }

  late final _$isAtFavoritesAtom =
      Atom(name: '_SavesStoreBase.isAtFavorites', context: context);

  @override
  bool get isAtFavorites {
    _$isAtFavoritesAtom.reportRead();
    return super.isAtFavorites;
  }

  @override
  set isAtFavorites(bool value) {
    _$isAtFavoritesAtom.reportWrite(value, super.isAtFavorites, () {
      super.isAtFavorites = value;
    });
  }

  late final _$initSavesAsyncAction =
      AsyncAction('_SavesStoreBase.initSaves', context: context);

  @override
  Future<void> initSaves() {
    return _$initSavesAsyncAction.run(() => super.initSaves());
  }

  late final _$deleteFavoritesAsyncAction =
      AsyncAction('_SavesStoreBase.deleteFavorites', context: context);

  @override
  Future<void> deleteFavorites(NewsFavorited newsDelete) {
    return _$deleteFavoritesAsyncAction
        .run(() => super.deleteFavorites(newsDelete));
  }

  late final _$deleteSavesAsyncAction =
      AsyncAction('_SavesStoreBase.deleteSaves', context: context);

  @override
  Future<void> deleteSaves(NewsSaved newsDelete) {
    return _$deleteSavesAsyncAction.run(() => super.deleteSaves(newsDelete));
  }

  late final _$saveNewsAsyncAction =
      AsyncAction('_SavesStoreBase.saveNews', context: context);

  @override
  Future<void> saveNews(NewsSaved newsSaving) {
    return _$saveNewsAsyncAction.run(() => super.saveNews(newsSaving));
  }

  late final _$favoriteNewsAsyncAction =
      AsyncAction('_SavesStoreBase.favoriteNews', context: context);

  @override
  Future<void> favoriteNews(NewsFavorited newsFavoriting) {
    return _$favoriteNewsAsyncAction
        .run(() => super.favoriteNews(newsFavoriting));
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_SavesStoreBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool boolean) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(boolean));
  }

  late final _$setAtSavesOrAtFavoritesAsyncAction =
      AsyncAction('_SavesStoreBase.setAtSavesOrAtFavorites', context: context);

  @override
  Future<void> setAtSavesOrAtFavorites(bool atSaves, bool atFavorites) {
    return _$setAtSavesOrAtFavoritesAsyncAction
        .run(() => super.setAtSavesOrAtFavorites(atSaves, atFavorites));
  }

  late final _$_SavesStoreBaseActionController =
      ActionController(name: '_SavesStoreBase', context: context);

  @override
  void updateNewsSavedList(List<NewsSaved> news) {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.updateNewsSavedList');
    try {
      return super.updateNewsSavedList(news);
    } finally {
      _$_SavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNewsFavoritedList(List<NewsFavorited> news) {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.updateNewsFavoritedList');
    try {
      return super.updateNewsFavoritedList(news);
    } finally {
      _$_SavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(SavesState newState) {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.setState');
    try {
      return super.setState(newState);
    } finally {
      _$_SavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<NewsSaved>? getNewsSavedList() {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.getNewsSavedList');
    try {
      return super.getNewsSavedList();
    } finally {
      _$_SavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<NewsFavorited>? getNewsFavoritedList() {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.getNewsFavoritedList');
    try {
      return super.getNewsFavoritedList();
    } finally {
      _$_SavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
newsSavedList: ${newsSavedList},
newsFavoritedList: ${newsFavoritedList},
newsSaved: ${newsSaved},
newsFavorited: ${newsFavorited},
isLoading: ${isLoading},
isAtSaves: ${isAtSaves},
isAtFavorites: ${isAtFavorites}
    ''';
  }
}
