import 'package:equatable/equatable.dart';
import 'package:pokedex_app/core/errors/failures.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';

//State

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Pokemon> pokemonList;
  final List<Pokemon> filteredList;
  final bool hasReachedMax;
  final int currentPage;
  final String searchQuery;
  final SortOption sortOption;
  final bool isLoadingMore;

  const PokemonLoaded({
    required this.pokemonList,
    required this.filteredList,
    this.hasReachedMax = false,
    this.currentPage = 0,
    this.searchQuery = '',
    this.sortOption = SortOption.number,
    this.isLoadingMore = false,
  });

  // 💡 Corrección reactiva: Si el usuario escribe algo, mostramos los filtrados obligatoriamente
  List<Pokemon> get displayList =>
      searchQuery.isNotEmpty ? filteredList : pokemonList;

  @override
  List<Object?> get props => [
        pokemonList,
        filteredList,
        hasReachedMax,
        currentPage,
        searchQuery,
        sortOption,
        isLoadingMore,
      ];

  PokemonLoaded copyWith({
    List<Pokemon>? pokemonList,
    List<Pokemon>? filteredList,
    bool? hasReachedMax,
    int? currentPage,
    String? searchQuery,
    SortOption? sortOption,
    bool? isLoadingMore,
  }) {
    return PokemonLoaded(
      pokemonList: pokemonList ?? this.pokemonList,
      filteredList: filteredList ?? this.filteredList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
      sortOption: sortOption ?? this.sortOption,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class PokemonError extends PokemonState {
  final Failure failure;

  const PokemonError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
