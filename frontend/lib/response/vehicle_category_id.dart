import 'package:json_annotation/json_annotation.dart';
part 'vehicle_category_id.g.dart';

@JsonSerializable()
class VehicleCategoryId {
  bool? success;
  dynamic data;

  VehicleCategoryId({this.data, this.success});

  factory VehicleCategoryId.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryIdFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleCategoryIdToJson(this);
}
