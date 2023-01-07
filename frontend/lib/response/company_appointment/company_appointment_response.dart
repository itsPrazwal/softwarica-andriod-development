import 'package:vehicle_rental_management_system/models/companyModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_appointment_response.g.dart';

@JsonSerializable()
class CompanyAppointmentResponse {
  List<CompanyModel>? details;

  CompanyAppointmentResponse({this.details});

  factory CompanyAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyAppointmentResponseToJson(this);
}
