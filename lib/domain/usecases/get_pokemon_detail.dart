import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/errors/failures.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repository.dart';

class GetPokemonDetail {
  final PokemonRepository repository;

  GetPokemonDetail(this.repository);

  Future<Either<Failure, PokemonDetail>> call({required int id}) async {
    if (id <= 0) {
      return const Left(ServerFailure(message: 'ID invalido'));
    }
    return await repository.getPokemonDetail(id: id);
  }
}
