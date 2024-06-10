import 'package:bloc/bloc.dart';
import 'package:facemask_application/data/datasources/history_datasources.dart';
import 'package:meta/meta.dart';

import '../../data/models/response/history_response_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryDatasources historyDatasources;
  HistoryBloc(this.historyDatasources) : super(HistoryInitial()) {
    on<FetchHistory>(_onFetchHistory);
  }

  void _onFetchHistory(FetchHistory event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    try {
      final history = await historyDatasources.fetchHistory();
      emit(HistoryLoaded(history: history));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}
