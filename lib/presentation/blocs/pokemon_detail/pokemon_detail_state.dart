import 'package:equatable/equatable.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object?> get props => [];
}

// Estado inicial antes de realizar cualquier petición
class PokemonDetailInitial extends PokemonDetailState {}

// Estado de carga exclusivo de esta vista
class PokemonDetailLoading extends PokemonDetailState {}

// 💡 Estado de Éxito: Garantiza que la entidad NO es nula al momento de pintar los widgets
class PokemonDetailSuccess extends PokemonDetailState {
  final PokemonDetail pokemonDetail;

  const PokemonDetailSuccess({required this.pokemonDetail});

  @override
  List<Object?> get props => [pokemonDetail];
}

// Estado de Error exclusivo para las fallas del detalle
class PokemonDetailError extends PokemonDetailState {
  final String message;

  const PokemonDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
