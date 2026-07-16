import 'package:json_annotation/json_annotation.dart';

part 'ability_slot_model.g.dart';

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
