import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/core/errors/exceptions.dart';
import 'package:pokedex_app/domain/entities/pokemon_description.dart';

// 💡 Importamos el sub-modelo que acabamos de extraer
import 'sub_models/flavor_text_entry_model.dart';

part 'pokemon_description_model.g.dart';

@JsonSerializable()
class PokemonDescriptionModel {
  @JsonKey(name: 'base_happiness')
  final int baseHappiness;
  @JsonKey(name: 'capture_rate')
  final int captureRate;
  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorTextEntry> flavorTextEntries;

  const PokemonDescriptionModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.flavorTextEntries,
  });

  factory PokemonDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDescriptionModelFromJson(json);

  // Eliminando caracteres raros de la PokeAPI
  String getCleanDescription({required String lang, String? fallback}) {
    try {
      final entry = flavorTextEntries.firstWhere(
        (entry) => entry.language.name == lang,
      );
      return entry.flavorText.replaceAll(RegExp(r'[\n\f\r]'), ' ');
    } catch (_) {
      if (fallback != null) return fallback;
      if (flavorTextEntries.isNotEmpty) {
        return flavorTextEntries.first.flavorText
            .replaceAll(RegExp(r'[\n\f\r]'), ' ');
      }
      throw const ServerException(message: 'No descripción disponible');
    }
  }

  // Convierte este modelo a la Entidad limpia de Dominio
  PokemonDescription toEntity() {
    final textEn = getCleanDescription(lang: 'en');
    return PokemonDescription(
      baseHappiness: baseHappiness,
      captureRate: captureRate,
      descriptionEn: textEn,
      descriptionEs: getCleanDescription(lang: 'es', fallback: textEn),
    );
  }
}
