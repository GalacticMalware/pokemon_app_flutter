import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/data/models/pokemon_datail/sub_models/ability_slot_model.dart';
import 'package:pokedex_app/data/models/pokemon_datail/sub_models/move_slot_model.dart';
import 'package:pokedex_app/data/models/pokemon_datail/sub_models/sprites_model.dart';
import 'package:pokedex_app/data/models/pokemon_datail/sub_models/stats_slot_model.dart';
import 'package:pokedex_app/data/models/pokemon_datail/sub_models/type_slot_model.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';

part 'pokemon_detail_model.g.dart';

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
      stats: stats.map((s) => s.toEntity()).toList(),
      height: height ~/ 10,
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
