part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<HistoryResponseModel> history;

  HistoryLoaded({required this.history});
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);
}
