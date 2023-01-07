import 'package:vehicle_rental_management_system/models/userModel.dart';
import 'package:vehicle_rental_management_system/models/vehicleModel.dart';
import 'package:json_annotation/json_annotation.dart';
part "get_company_ui_appointment.g.dart";

@JsonSerializable()
class GetCompanyUIAppointment {
  @JsonKey(name: "_id")
  String? id;
  String? department;
  String? startDate;
  String? endDate;
  String? doctorId;
  String? status;
  String? fullname;
  String? mobile;
  String? email;
  UserModel? patientId;
  VehicleModel? vehicleId;

  GetCompanyUIAppointment({
    this.doctorId,
    this.department,
    this.email,
    this.fullname,
    this.id,
    this.mobile,
    this.patientId,
    this.status,
    this.endDate,
    this.startDate,
    this.vehicleId,
  });

  factory GetCompanyUIAppointment.fromJson(Map<String, dynamic> json) =>
      _$GetCompanyUIAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$GetCompanyUIAppointmentToJson(this);
}
