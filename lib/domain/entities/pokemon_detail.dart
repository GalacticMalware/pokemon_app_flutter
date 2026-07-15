class PokemonDetail {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;
  final List<String> moves;
  final List<PokemonStat> stats;
  final int height;
  final int weight;
  final int baseExperience;
  final int baseHappiness;
  final int captureRate;
  final String descriptionEn;
  final String descriptionEs;

  const PokemonDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
    required this.moves,
    required this.stats,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.baseHappiness,
    required this.captureRate,
    required this.descriptionEn,
    required this.descriptionEs,
  });
}

//Entidad de dominio para procesar estadisticas en la UI
class PokemonStat {
  final String name;
  final int baseStat;

  const PokemonStat({
    required this.name,
    required this.baseStat,
  });
}
