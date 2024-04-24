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

  late final _$newsSaveListAtom =
      Atom(name: '_SavesStoreBase.newsSaveList', context: context);

  @override
  List<NewsSave>? get newsSaveList {
    _$newsSaveListAtom.reportRead();
    return super.newsSaveList;
  }

  @override
  set newsSaveList(List<NewsSave>? value) {
    _$newsSaveListAtom.reportWrite(value, super.newsSaveList, () {
      super.newsSaveList = value;
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
  Future<void> deleteSaves(NewsSave newsDelete) {
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
  void updateNewsList(List<NewsSave> news) {
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
  List<NewsSave>? getNewsList() {
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
newsSaveList: ${newsSaveList},
isLoading: ${isLoading}
    ''';
  }
}
