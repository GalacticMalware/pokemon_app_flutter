import 'package:equatable/equatable.dart';

//Eventos

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class LoadPokemonEvent extends PokemonEvent {
  const LoadPokemonEvent();
}

class LoadMorePokemonEvent extends PokemonEvent {
  const LoadMorePokemonEvent();
}

class SearchPokemonEvent extends PokemonEvent {
  final String query;

  const SearchPokemonEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class SortPokemonEvent extends PokemonEvent {
  final SortOption sortOption;

  const SortPokemonEvent({required this.sortOption});

  @override
  List<Object?> get props => [sortOption];
}

enum SortOption {
  number,
  name,
}
