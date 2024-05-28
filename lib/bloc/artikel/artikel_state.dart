part of 'artikel_bloc.dart';

@immutable
abstract class ArtikelState {}

class ArtikelInitial extends ArtikelState {}

class ArtikelLoading extends ArtikelState {}

class ArtikelLoaded extends ArtikelState {
  final List<ArtikelResponseModel> artikels;

  ArtikelLoaded(this.artikels);
}

class ArtikelError extends ArtikelState {
  final String message;

  ArtikelError(this.message);
}
