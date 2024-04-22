import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';


@dao
abstract class NewsDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNews(NewsSave news);
}