import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_favorited_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/entities/news_saved_entity.dart';
import 'package:flutter_clean_architecture/src/features/saves/domain/errors/saves_error.dart';


abstract class SavesState {}

class StartState implements SavesState {
  const StartState();
}

class LoadingState implements SavesState {
  const LoadingState();
}

class ErrorState implements SavesState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SavesState {
  final List<NewsSaved> listSaved;
  final List<NewsFavorited> listFavorited;
  const SuccessState(this.listSaved, this.listFavorited);
}