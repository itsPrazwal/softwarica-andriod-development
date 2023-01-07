// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_company_ui_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompanyUIAppointment _$GetCompanyUIAppointmentFromJson(
    Map<String, dynamic> json) {
  return GetCompanyUIAppointment(
    doctorId: json['doctorId'] as String?,
    department: json['department'] as String?,
    email: json['email'] as String?,
    fullname: json['fullname'] as String?,
    id: json['_id'] as String?,
    mobile: json['mobile'] as String?,
    patientId: json['patientId'] == null
        ? null
        : UserModel.fromJson(json['patientId'] as Map<String, dynamic>),
    status: json['status'] as String?,
    endDate: json['endDate'] as String?,
    startDate: json['startDate'] as String?,
    vehicleId: json['vehicleId'] == null
        ? null
        : VehicleModel.fromJson(json['vehicleId'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetCompanyUIAppointmentToJson(
        GetCompanyUIAppointment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'department': instance.department,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'doctorId': instance.doctorId,
      'status': instance.status,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'patientId': instance.patientId,
      'vehicleId': instance.vehicleId,
    };
