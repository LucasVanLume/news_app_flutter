import 'package:flutter_clean_architecture/src/features/home/domain/entities/news_save_entity.dart';
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
  final List<NewsSave> list;
  const SuccessState(this.list);
}