import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/errors/failures.dart';
import 'package:pokedex_app/domain/entities/pokemon_description.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repository.dart';

class GetPokemonDescription {
  final PokemonRepository repository;

  GetPokemonDescription(this.repository);

  Future<Either<Failure, PokemonDescription>> call({required int id}) async {
    if (id <= 0) {
      return const Left(ServerFailure(message: 'ID invalido'));
    }
    return await repository.getPokemonDescription(id: id);
  }
}
