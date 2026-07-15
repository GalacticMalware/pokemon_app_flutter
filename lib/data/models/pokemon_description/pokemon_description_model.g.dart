// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDescriptionModel _$PokemonDescriptionModelFromJson(
        Map<String, dynamic> json) =>
    PokemonDescriptionModel(
      baseHappiness: (json['base_happiness'] as num).toInt(),
      captureRate: (json['capture_rate'] as num).toInt(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDescriptionModelToJson(
        PokemonDescriptionModel instance) =>
    <String, dynamic>{
      'base_happiness': instance.baseHappiness,
      'capture_rate': instance.captureRate,
      'flavor_text_entries': instance.flavorTextEntries,
    };

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String,
      language:
          LanguageDetail.fromJson(json['language'] as Map<String, dynamic>),
      version: VersionDetail.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

LanguageDetail _$LanguageDetailFromJson(Map<String, dynamic> json) =>
    LanguageDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$LanguageDetailToJson(LanguageDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

VersionDetail _$VersionDetailFromJson(Map<String, dynamic> json) =>
    VersionDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VersionDetailToJson(VersionDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
