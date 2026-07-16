import 'package:json_annotation/json_annotation.dart';

part 'type_slot_model.g.dart';

@JsonSerializable()
class TypeSlot {
  final int slot;
  final TypeDetail type;

  const TypeSlot({required this.slot, required this.type});

  factory TypeSlot.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotFromJson(json);
}

@JsonSerializable()
class TypeDetail {
  final String name;

  const TypeDetail({required this.name});

  factory TypeDetail.fromJson(Map<String, dynamic> json) =>
      _$TypeDetailFromJson(json);
}
