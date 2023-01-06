import 'package:json_annotation/json_annotation.dart';

part "vehicle_category.g.dart";

@JsonSerializable()
class VehicleCategory {
  @JsonKey(name: "_id")
  String? id;
  String? name;

  VehicleCategory({this.id, this.name});

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleCategoryToJson(this);
}
