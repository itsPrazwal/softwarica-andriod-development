import 'package:vehicle_rental_management_system/models/vehicle_category.dart';
import 'package:json_annotation/json_annotation.dart';

part "vehicle_category_response.g.dart";

@JsonSerializable()
class VehicleCategoryResponse {
  bool? success;
  List<VehicleCategory>? data;

  VehicleCategoryResponse({this.data, this.success});

  factory VehicleCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleCategoryResponseToJson(this);
}
