import 'package:equatable/equatable.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object?> get props => [];
}

// 💡 Evento formal encargado de disparar la carga concurrente del detalle
class FetchPokemonDetailEvent extends PokemonDetailEvent {
  final int pokemonId;

  const FetchPokemonDetailEvent({required this.pokemonId});

  @override
  List<Object?> get props => [pokemonId];
}
