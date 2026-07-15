import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/errors/failures.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/domain/entities/pokemon_description.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';

//Reposotorio de los pokemones
abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList({
    required int offset,
    required int limit,
  });

  Future<Either<Failure, PokemonDetail>> getPokemonDetail({required int id});

  Future<Either<Failure, PokemonDescription>> getPokemonDescription(
      {required int id});
}
