import 'package:bloc/bloc.dart';
import 'package:facemask_application/data/datasources/artikel_datasources.dart';
import 'package:facemask_application/data/models/response/artikel_response_model.dart';
import 'package:meta/meta.dart';

part 'artikel_event.dart';
part 'artikel_state.dart';

class ArtikelBloc extends Bloc<ArtikelEvent, ArtikelState> {
  final ArtikelDatasources artikelDatasources;
  ArtikelBloc(this.artikelDatasources) : super(ArtikelInitial()) {
    on<FetchArtikels>(_onFetchArtikels);
  }

  void _onFetchArtikels(FetchArtikels event, Emitter<ArtikelState> emit) async {
    emit(ArtikelLoading());
    try {
      final artikels = await artikelDatasources.fetchArtikels();
      emit(ArtikelLoaded(artikels));
    } catch (e) {
      emit(ArtikelError(e.toString()));
    }
  }
}
