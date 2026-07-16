import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entry_model.g.dart';

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
