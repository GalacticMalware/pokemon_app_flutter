import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_detail.dart';

import 'pokemon_detail_event.dart';
import 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final GetPokemonDetail getPokemonDetail;

  PokemonDetailBloc({
    required this.getPokemonDetail,
  }) : super(PokemonDetailInitial()) {
    on<FetchPokemonDetailEvent>(_onFetchPokemonDetail);
  }

  Future<void> _onFetchPokemonDetail(
    FetchPokemonDetailEvent event,
    Emitter<PokemonDetailState> emit,
  ) async {
    emit(PokemonDetailLoading());

    final result = await getPokemonDetail(id: event.pokemonId);

    result.fold(
      (failure) => emit(PokemonDetailError(message: failure.message)),
      (pokemonDetail) =>
          emit(PokemonDetailSuccess(pokemonDetail: pokemonDetail)),
    );
  }
}
