// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vehicle_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVehicleAppointment _$BookVehicleAppointmentFromJson(
    Map<String, dynamic> json) {
  return BookVehicleAppointment(
    department: json['department'] as String?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    time: json['time'] as String?,
    email: json['email'] as String?,
    fullname: json['fullname'] as String?,
    mobile: json['mobile'] as String?,
    doctorId: json['doctorId'] as String?,
    vehicleId: json['vehicleId'] as String?,
  );
}

Map<String, dynamic> _$BookVehicleAppointmentToJson(
        BookVehicleAppointment instance) =>
    <String, dynamic>{
      'department': instance.department,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'time': instance.time,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'doctorId': instance.doctorId,
      'vehicleId': instance.vehicleId,
    };
