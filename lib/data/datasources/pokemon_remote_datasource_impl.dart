import 'package:http/http.dart' as http;
import 'package:pokedex_app/core/const/app_constants.dart';
import 'package:pokedex_app/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_app/data/models/pokemon_datail/pokemon_detail_model.dart';
import 'package:pokedex_app/data/models/pokemon_datail/pokemon_model.dart';
import 'package:pokedex_app/data/models/pokemon_description/pokemon_description_model.dart';
import 'package:pokedex_app/data/utils/perform_get_request.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonListResponse> getPokemonList({
    required int offset,
    required int limit,
  }) async {
    final endpoint =
        '${AppConstants.pokemonEndpoint}?offset=$offset&limit=$limit';
    final jsonData = await performGetRequest(endpoint: endpoint);
    return PokemonListResponse.fromJson(jsonData);
  }

  @override
  Future<PokemonDetailModel> getPokemonDetail({required int id}) async {
    final endpoint = '${AppConstants.pokemonEndpoint}/$id';
    final jsonData = await performGetRequest(endpoint: endpoint);
    return PokemonDetailModel.fromJson(jsonData);
  }

  @override
  Future<PokemonDescriptionModel> getPokemonDescription(
      {required int id}) async {
    final endpoint = '${AppConstants.pokemonEndpointDescription}/$id';
    final jsonData = await performGetRequest(endpoint: endpoint);
    return PokemonDescriptionModel.fromJson(jsonData);
  }
}
