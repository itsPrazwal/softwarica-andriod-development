// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompanyAppointmentResponse _$GetCompanyAppointmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetCompanyAppointmentResponse(
    doctorId: json['doctorId'] == null
        ? null
        : CompanyModel.fromJson(json['doctorId'] as Map<String, dynamic>),
    department: json['department'] as String?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    email: json['email'] as String?,
    vehicleId: json['vehicleId'] == null
        ? null
        : VehicleModel.fromJson(json['vehicleId'] as Map<String, dynamic>),
    fullname: json['fullname'] as String?,
    id: json['_id'] as String?,
    mobile: json['mobile'] as String?,
    patientId: json['patientId'] as String?,
    time: json['time'] as String?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$GetCompanyAppointmentResponseToJson(
        GetCompanyAppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'department': instance.department,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'time': instance.time,
      'doctorId': instance.doctorId,
      'vehicleId': instance.vehicleId,
      'status': instance.status,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'patientId': instance.patientId,
    };
