// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) =>
    PokemonDetailModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      baseExperience: (json['base_experience'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => TypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => AbilitySlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      moves: (json['moves'] as List<dynamic>)
          .map((e) => MoveSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => StatsSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailModelToJson(PokemonDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'types': instance.types,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
      'moves': instance.moves,
      'stats': instance.stats,
    };

StatsSlot _$StatsSlotFromJson(Map<String, dynamic> json) => StatsSlot(
      baseStat: (json['base_stat'] as num).toInt(),
      stat: StatDetail.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsSlotToJson(StatsSlot instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };

StatDetail _$StatDetailFromJson(Map<String, dynamic> json) => StatDetail(
      name: json['name'] as String,
    );

Map<String, dynamic> _$StatDetailToJson(StatDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

MoveSlot _$MoveSlotFromJson(Map<String, dynamic> json) => MoveSlot(
      move: MoveDetail.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveSlotToJson(MoveSlot instance) => <String, dynamic>{
      'move': instance.move,
    };

MoveDetail _$MoveDetailFromJson(Map<String, dynamic> json) => MoveDetail(
      name: json['name'] as String,
    );

Map<String, dynamic> _$MoveDetailToJson(MoveDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

TypeSlot _$TypeSlotFromJson(Map<String, dynamic> json) => TypeSlot(
      slot: (json['slot'] as num).toInt(),
      type: TypeDetail.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeSlotToJson(TypeSlot instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

TypeDetail _$TypeDetailFromJson(Map<String, dynamic> json) => TypeDetail(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeDetailToJson(TypeDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

AbilitySlot _$AbilitySlotFromJson(Map<String, dynamic> json) => AbilitySlot(
      ability: AbilityDetail.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
    );

Map<String, dynamic> _$AbilitySlotToJson(AbilitySlot instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
    };

AbilityDetail _$AbilityDetailFromJson(Map<String, dynamic> json) =>
    AbilityDetail(
      name: json['name'] as String,
    );

Map<String, dynamic> _$AbilityDetailToJson(AbilityDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      other: json['other'] == null
          ? null
          : OtherSprites.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'other': instance.other,
    };

OtherSprites _$OtherSpritesFromJson(Map<String, dynamic> json) => OtherSprites(
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherSpritesToJson(OtherSprites instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) =>
    OfficialArtwork(
      frontDefault: json['front_default'] as String?,
    );

Map<String, dynamic> _$OfficialArtworkToJson(OfficialArtwork instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };
