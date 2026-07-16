import 'package:json_annotation/json_annotation.dart';

part 'sprites_model.g.dart';

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
