import 'package:vehicle_rental_management_system/models/companyModel.dart';
import 'package:vehicle_rental_management_system/models/vehicleModel.dart';
import 'package:json_annotation/json_annotation.dart';
part "get_vehicle_appointment_response.g.dart";

@JsonSerializable()
class GetCompanyAppointmentResponse {
  @JsonKey(name: "_id")
  String? id;
  String? department;
  String? startDate;
  String? endDate;
  String? time;
  CompanyModel? doctorId;
  VehicleModel? vehicleId;
  String? status;
  String? fullname;
  String? mobile;
  String? email;
  String? patientId;

  GetCompanyAppointmentResponse({
    this.doctorId,
    this.department,
    this.startDate,
    this.endDate,
    this.email,
    this.vehicleId,
    this.fullname,
    this.id,
    this.mobile,
    this.patientId,
    this.time,
    this.status,
  });

  factory GetCompanyAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCompanyAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCompanyAppointmentResponseToJson(this);
}
