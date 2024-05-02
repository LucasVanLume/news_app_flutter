// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  // ignore: library_private_types_in_public_api
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  // ignore: library_private_types_in_public_api
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsInsertDao? _newsInsertDaoInstance;

  NewsGetDeltDao? _newsGetDeltDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `newsTable` (`author` TEXT, `title` TEXT, `url` TEXT, `urlToImage` TEXT, PRIMARY KEY (`author`, `title`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `newsFavoriteTable` (`author` TEXT, `title` TEXT, `url` TEXT, `urlToImage` TEXT, PRIMARY KEY (`author`, `title`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsInsertDao get newsInsertDao {
    return _newsInsertDaoInstance ??= _$NewsInsertDao(database, changeListener);
  }

  @override
  NewsGetDeltDao get newsGetDeltDao {
    return _newsGetDeltDaoInstance ??=
        _$NewsGetDeltDao(database, changeListener);
  }
}

class _$NewsInsertDao extends NewsInsertDao {
  _$NewsInsertDao(
    this.database,
    this.changeListener,
  )   : _newsSaveModelCoreInsertionAdapter = InsertionAdapter(
            database,
            'newsTable',
            (NewsSaveModelCore item) => <String, Object?>{
                  'author': item.author,
                  'title': item.title,
                  'url': item.url,
                  'urlToImage': item.urlToImage
                }),
        _newsFavoriteModelCoreInsertionAdapter = InsertionAdapter(
            database,
            'newsFavoriteTable',
            (NewsFavoriteModelCore item) => <String, Object?>{
                  'author': item.author,
                  'title': item.title,
                  'url': item.url,
                  'urlToImage': item.urlToImage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<NewsSaveModelCore> _newsSaveModelCoreInsertionAdapter;

  final InsertionAdapter<NewsFavoriteModelCore>
      _newsFavoriteModelCoreInsertionAdapter;

  @override
  Future<void> insertNewsSave(NewsSaveModelCore newsSave) async {
    await _newsSaveModelCoreInsertionAdapter.insert(
        newsSave, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertNewsFavorite(NewsFavoriteModelCore newsFavorite) async {
    await _newsFavoriteModelCoreInsertionAdapter.insert(
        newsFavorite, OnConflictStrategy.replace);
  }
}

class _$NewsGetDeltDao extends NewsGetDeltDao {
  _$NewsGetDeltDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _newsSaveModelCoreDeletionAdapter = DeletionAdapter(
            database,
            'newsTable',
            ['author', 'title'],
            (NewsSaveModelCore item) => <String, Object?>{
                  'author': item.author,
                  'title': item.title,
                  'url': item.url,
                  'urlToImage': item.urlToImage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final DeletionAdapter<NewsSaveModelCore> _newsSaveModelCoreDeletionAdapter;

  @override
  Future<List<NewsSaveModelCore>> getAllNewsSaved() async {
    return _queryAdapter.queryList('SELECT * FROM newsTable',
        mapper: (Map<String, Object?> row) => NewsSaveModelCore(
            author: row['author'] as String?,
            title: row['title'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?));
  }

  @override
  Future<List<NewsFavoriteModelCore>> getAllNewsFavorited() async {
    return _queryAdapter.queryList('SELECT * FROM newsFavoriteTable',
        mapper: (Map<String, Object?> row) => NewsFavoriteModelCore(
            author: row['author'] as String?,
            title: row['title'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?));
  }

  @override
  Future<void> deleteNewsSaved(NewsSaveModelCore newsSaved) async {
    await _newsSaveModelCoreDeletionAdapter.delete(newsSaved);
  }
}
