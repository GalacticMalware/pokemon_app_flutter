import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/core/const/app_constants.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

//Modelo de pokemon para la respuesta
@JsonSerializable()
class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResult> results;

  const PokemonListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  // Convierte toda la respuesta de la API en una lista de entidades
  List<Pokemon> toEntityList() {
    return results.map((result) => result.toEntity()).toList();
  }
}

@JsonSerializable()
class PokemonResult {
  final String name;
  final String url;

  const PokemonResult({required this.name, required this.url});

  factory PokemonResult.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultFromJson(json);

  // Extraer ID de la URL
  int get id {
    final parts = url.split('/');
    return int.parse(parts[parts.length - 2]);
  }

  // Mapea el objeto crudo de la API
  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name[0].toUpperCase() + name.substring(1),
      imageUrl: AppConstants.getPokemonImageUrl(id),
      thumbnailUrl: AppConstants.getPokemonThumbnailUrl(id),
    );
  }
}
