import 'package:vehicle_rental_management_system/response/doctor_ui_appointment/get_company_ui_appointment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_ui_appointment.g.dart';

@JsonSerializable()
class CompanyUIAppointment {
  bool? success;
  List<GetCompanyUIAppointment>? data;

  CompanyUIAppointment({
    this.data,
    this.success,
  });

  factory CompanyUIAppointment.fromJson(Map<String, dynamic> json) =>
      _$CompanyUIAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyUIAppointmentToJson(this);
}
