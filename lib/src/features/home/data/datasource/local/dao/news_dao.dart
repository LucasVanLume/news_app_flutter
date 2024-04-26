import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture/core/data/models/news_save_model_core.dart';


@dao
abstract class NewsInsertDao {
  
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNews(NewsSaveModelCore news);

}