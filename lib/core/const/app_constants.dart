class AppConstants {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const String pokemonEndpoint = '/pokemon';
  static const String pokemonEndpointDescription = '/pokemon-species';
  static const int defaultLimit = 20;
  static const int maxPokemon = 151; // Primera generación

  // URL de imágenes
  static String getPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  static String getPokemonThumbnailUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}
