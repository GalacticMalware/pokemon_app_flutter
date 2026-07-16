import 'package:pokedex_app/data/models/pokemon_datail/pokemon_detail_model.dart';
import 'package:pokedex_app/data/models/pokemon_datail/pokemon_model.dart';
import 'package:pokedex_app/data/models/pokemon_description/pokemon_description_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListResponse> getPokemonList({
    required int offset,
    required int limit,
  });

  Future<PokemonDetailModel> getPokemonDetail({required int id});

  Future<PokemonDescriptionModel> getPokemonDescription({required int id});
}
