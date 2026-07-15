import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/errors/exceptions.dart';
import 'package:pokedex_app/core/errors/failures.dart';
import 'package:pokedex_app/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_app/data/models/pokemon_datail/pokemon_detail_model.dart';
import 'package:pokedex_app/data/models/pokemon_description/pokemon_description_model.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/domain/entities/pokemon_description.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repository.dart';

//Reposotorios

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await remoteDataSource.getPokemonList(
        offset: offset,
        limit: limit,
      );
      //Delegado directo al metodo de conversion del modelo
      return Right(response.toEntityList());
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, PokemonDetail>> getPokemonDetail({
    required int id,
  }) async {
    try {
      final response = await Future.wait([
        remoteDataSource.getPokemonDetail(id: id),
        remoteDataSource.getPokemonDescription(id: id),
      ]);

      final detailModel = response[0] as PokemonDetailModel;
      final descriptionModel = response[1] as PokemonDescriptionModel;

      final textEn = descriptionModel.getCleanDescription(lang: 'en');
      final textEs =
          descriptionModel.getCleanDescription(lang: 'es', fallback: textEn);

      // Modelos en la Entidad utilizando toEntity()
      final detail = detailModel.toEntity(
        baseHappiness: descriptionModel.baseHappiness,
        captureRate: descriptionModel.captureRate,
        descriptionEn: textEn,
        descriptionEs: textEs,
      );

      return Right(detail);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  @override
  Future<Either<Failure, PokemonDescription>> getPokemonDescription({
    required int id,
  }) async {
    try {
      final response = await remoteDataSource.getPokemonDescription(id: id);
      return Right(response.toEntity());
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  Failure _handleException(dynamic e) {
    if (e is ServerException) {
      return ServerFailure(message: e.message);
    }
    if (e is NetworkException) {
      return NetworkFailure(message: e.message);
    }
    return ServerFailure(message: 'Error inesperado: ${e.toString()}');
  }
}
