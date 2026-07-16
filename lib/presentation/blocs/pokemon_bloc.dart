import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/const/app_constants.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_state.dart';
import 'package:pokedex_app/presentation/utils/sort_and_filter.dart';

//Bloc

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonList getPokemonList;

  PokemonBloc({
    required this.getPokemonList,
  }) : super(PokemonInitial()) {
    on<LoadPokemonEvent>(_onLoadPokemon);
    on<LoadMorePokemonEvent>(_onLoadMorePokemon);
    on<SearchPokemonEvent>(_onSearchPokemon);
    on<SortPokemonEvent>(_onSortPokemon);
  }

  Future<void> _onLoadPokemon(
    LoadPokemonEvent event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoading());

    final result = await getPokemonList(
      offset: 0,
      limit: AppConstants.defaultLimit,
    );

    result.fold(
      (failure) => emit(PokemonError(failure: failure)),
      (pokemonList) {
        emit(PokemonLoaded(
          pokemonList: pokemonList,
          filteredList: const [],
          hasReachedMax: pokemonList.length < AppConstants.defaultLimit,
          currentPage: 0,
        ));
      },
    );
  }

  Future<void> _onLoadMorePokemon(
    LoadMorePokemonEvent event,
    Emitter<PokemonState> emit,
  ) async {
    final currentState = state;

    if (currentState is! PokemonLoaded || currentState.isLoadingMore) return;
    if (currentState.hasReachedMax) return;

    emit(currentState.copyWith(isLoadingMore: true));

    final nextPage = currentState.currentPage + 1;
    final offset = nextPage * AppConstants.defaultLimit;

    final result = await getPokemonList(
      offset: offset,
      limit: AppConstants.defaultLimit,
    );

    result.fold(
      (failure) => emit(PokemonError(failure: failure)),
      (newPokemonList) {
        final updatedList = List<Pokemon>.from(currentState.pokemonList)
          ..addAll(newPokemonList);

        // Si hay una busqueda activa al cargar mas, recalculamos los elementos filtrados
        final updatedFilteredList = currentState.searchQuery.isNotEmpty
            ? filterPokemonList(updatedList, currentState.searchQuery)
            : const <Pokemon>[];

        emit(currentState.copyWith(
          pokemonList: updatedList,
          filteredList: updatedFilteredList,
          currentPage: nextPage,
          hasReachedMax: newPokemonList.length < AppConstants.defaultLimit,
          isLoadingMore: false,
        ));
      },
    );
  }

  Future<void> _onSearchPokemon(
    SearchPokemonEvent event,
    Emitter<PokemonState> emit,
  ) async {
    final currentState = state;
    if (currentState is! PokemonLoaded) return;

    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      emit(currentState.copyWith(filteredList: const [], searchQuery: ''));
      return;
    }

    final filtered = filterPokemonList(currentState.pokemonList, query);

    emit(currentState.copyWith(filteredList: filtered, searchQuery: query));
  }

  Future<void> _onSortPokemon(
    SortPokemonEvent event,
    Emitter<PokemonState> emit,
  ) async {
    final currentState = state;
    if (currentState is! PokemonLoaded) return;

    final sortedList =
        sortPokemonList(currentState.pokemonList, event.sortOption);

    final filteredList = currentState.searchQuery.isNotEmpty
        ? filterPokemonList(sortedList, currentState.searchQuery)
        : const <Pokemon>[];

    emit(currentState.copyWith(
      pokemonList: sortedList,
      filteredList: filteredList,
      sortOption: event.sortOption,
    ));
  }
}
