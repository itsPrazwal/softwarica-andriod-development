// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_ui_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyUIAppointment _$CompanyUIAppointmentFromJson(Map<String, dynamic> json) {
  return CompanyUIAppointment(
    data: (json['data'] as List<dynamic>?)
        ?.map(
            (e) => GetCompanyUIAppointment.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$CompanyUIAppointmentToJson(
        CompanyUIAppointment instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
