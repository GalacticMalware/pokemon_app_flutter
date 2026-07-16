import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';

part 'stats_slot_model.g.dart';

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
