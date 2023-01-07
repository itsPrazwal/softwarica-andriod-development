// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_appointment_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleAppointmentResponseData _$VehicleAppointmentResponseDataFromJson(
    Map<String, dynamic> json) {
  return VehicleAppointmentResponseData(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) =>
            GetCompanyAppointmentResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$VehicleAppointmentResponseDataToJson(
        VehicleAppointmentResponseData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
