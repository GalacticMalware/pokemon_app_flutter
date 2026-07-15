import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/core/errors/exceptions.dart';
// 💡 Importamos la entidad de dominio correspondiente
import 'package:pokedex_app/domain/entities/pokemon_description.dart';

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

  //Eliminando caracteres raros de la PokeAPI
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

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  final String flavorText;
  final LanguageDetail language;
  final VersionDetail version;

  const FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);
}

@JsonSerializable()
class LanguageDetail {
  final String name;
  final String url;

  const LanguageDetail({required this.name, required this.url});

  factory LanguageDetail.fromJson(Map<String, dynamic> json) =>
      _$LanguageDetailFromJson(json);
}

@JsonSerializable()
class VersionDetail {
  final String name;
  final String url;

  const VersionDetail({required this.name, required this.url});

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailFromJson(json);
}
