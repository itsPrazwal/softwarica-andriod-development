// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyAppointmentResponse _$CompanyAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return CompanyAppointmentResponse(
    details: (json['details'] as List<dynamic>?)
        ?.map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompanyAppointmentResponseToJson(
        CompanyAppointmentResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
    };
