// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleAppointmentResponse _$VehicleAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return VehicleAppointmentResponse(
    details: (json['details'] as List<dynamic>?)
        ?.map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VehicleAppointmentResponseToJson(
        VehicleAppointmentResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
    };
