// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCategoryResponse _$VehicleCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return VehicleCategoryResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => VehicleCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$VehicleCategoryResponseToJson(
        VehicleCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
