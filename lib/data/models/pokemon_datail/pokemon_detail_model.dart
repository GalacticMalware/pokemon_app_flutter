import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';

part 'pokemon_detail_model.g.dart';

//Modelo de pokemon detail para la informacion del pokemon

@JsonSerializable()
class PokemonDetailModel {
  final int id;
  final String name;
  final int height;
  final int weight;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  final List<TypeSlot> types;
  final List<AbilitySlot> abilities;
  final Sprites sprites;
  final List<MoveSlot> moves;
  final List<StatsSlot> stats;

  const PokemonDetailModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.types,
    required this.abilities,
    required this.sprites,
    required this.moves,
    required this.stats,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);

  // 💡 SEPARACIÓN LOGRADA: Convierte el JSON crudo en la Entidad pura de Dominio
  PokemonDetail toEntity({
    required int baseHappiness,
    required int captureRate,
    required String descriptionEn,
    required String descriptionEs,
  }) {
    return PokemonDetail(
      id: id,
      name: _capitalize(name),
      imageUrl: sprites.other?.officialArtwork?.frontDefault ?? '',
      types: types.map((t) => t.type.name).toList(),
      abilities: abilities
          .where((a) => !a.isHidden)
          .map((a) => _capitalize(a.ability.name))
          .toList(),
      moves: moves.map((m) => m.move.name).toList(),
      stats: stats
          .map((s) => s.toEntity())
          .toList(), // Mapea cada estadística individualmente
      height:
          height ~/ 10, // Conversión matemática de unidades delegada a datos
      weight: weight ~/ 10,
      baseExperience: baseExperience,
      baseHappiness: baseHappiness,
      captureRate: captureRate,
      descriptionEn: descriptionEn,
      descriptionEs: descriptionEs,
    );
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

@JsonSerializable()
class StatsSlot {
  @JsonKey(name: 'base_stat')
  final int baseStat;
  final StatDetail stat;

  const StatsSlot({required this.baseStat, required this.stat});

  factory StatsSlot.fromJson(Map<String, dynamic> json) =>
      _$StatsSlotFromJson(json);

  // 💡 Transforma el slot del JSON al formato estricto de la Entidad de Dominio
  PokemonStat toEntity() {
    return PokemonStat(
      name: stat.name,
      baseStat: baseStat,
    );
  }
}

@JsonSerializable()
class StatDetail {
  final String name;
  const StatDetail({required this.name});
  factory StatDetail.fromJson(Map<String, dynamic> json) =>
      _$StatDetailFromJson(json);
}

@JsonSerializable()
class MoveSlot {
  @JsonKey(name: 'move')
  final MoveDetail move;
  const MoveSlot({required this.move});
  factory MoveSlot.fromJson(Map<String, dynamic> json) =>
      _$MoveSlotFromJson(json);
}

@JsonSerializable()
class MoveDetail {
  final String name;
  const MoveDetail({required this.name});
  factory MoveDetail.fromJson(Map<String, dynamic> json) =>
      _$MoveDetailFromJson(json);
}

@JsonSerializable()
class TypeSlot {
  final int slot;
  final TypeDetail type;
  const TypeSlot({required this.slot, required this.type});
  factory TypeSlot.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotFromJson(json);
}

@JsonSerializable()
class TypeDetail {
  final String name;
  const TypeDetail({required this.name});
  factory TypeDetail.fromJson(Map<String, dynamic> json) =>
      _$TypeDetailFromJson(json);
}

@JsonSerializable()
class AbilitySlot {
  final AbilityDetail ability;
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  const AbilitySlot({required this.ability, required this.isHidden});
  factory AbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$AbilitySlotFromJson(json);
}

@JsonSerializable()
class AbilityDetail {
  final String name;
  const AbilityDetail({required this.name});
  factory AbilityDetail.fromJson(Map<String, dynamic> json) =>
      _$AbilityDetailFromJson(json);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'other')
  final OtherSprites? other;
  const Sprites({required this.other});
  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}

@JsonSerializable()
class OtherSprites {
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;
  const OtherSprites({required this.officialArtwork});
  factory OtherSprites.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesFromJson(json);
}

@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  const OfficialArtwork({required this.frontDefault});
  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}
