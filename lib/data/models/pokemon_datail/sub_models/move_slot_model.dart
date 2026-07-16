import 'package:json_annotation/json_annotation.dart';

part 'move_slot_model.g.dart';

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
