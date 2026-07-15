import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/errors/failures.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repository.dart';

class GetPokemonList {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  Future<Either<Failure, List<Pokemon>>> call({
    required int offset,
    required int limit,
  }) async {
    if (offset < 0) {
      return const Left(ServerFailure(message: 'Offset no puede ser negativo'));
    }
    if (limit <= 0) {
      return const Left(ServerFailure(message: 'Limit debe ser mayor a 0'));
    }

    return await repository.getPokemonList(offset: offset, limit: limit);
  }
}
