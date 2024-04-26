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

  late final _$initSavesAsyncAction =
      AsyncAction('_SavesStoreBase.initSaves', context: context);

  @override
  Future<void> initSaves() {
    return _$initSavesAsyncAction.run(() => super.initSaves());
  }

  late final _$deleteSavesAsyncAction =
      AsyncAction('_SavesStoreBase.deleteSaves', context: context);

  @override
  Future<void> deleteSaves(NewsSaved newsDelete) {
    return _$deleteSavesAsyncAction.run(() => super.deleteSaves(newsDelete));
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_SavesStoreBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool boolean) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(boolean));
  }

  late final _$_SavesStoreBaseActionController =
      ActionController(name: '_SavesStoreBase', context: context);

  @override
  void updateNewsList(List<NewsSaved> news) {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.updateNewsList');
    try {
      return super.updateNewsList(news);
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
  List<NewsSaved>? getNewsList() {
    final _$actionInfo = _$_SavesStoreBaseActionController.startAction(
        name: '_SavesStoreBase.getNewsList');
    try {
      return super.getNewsList();
    } finally {
      _$_SavesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
newsSavedList: ${newsSavedList},
isLoading: ${isLoading}
    ''';
  }
}
