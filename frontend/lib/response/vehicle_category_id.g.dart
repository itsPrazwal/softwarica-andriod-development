// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCategoryId _$VehicleCategoryIdFromJson(Map<String, dynamic> json) {
  return VehicleCategoryId(
    data: json['data'],
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$VehicleCategoryIdToJson(VehicleCategoryId instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
