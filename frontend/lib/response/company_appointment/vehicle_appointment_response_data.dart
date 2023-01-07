import 'package:vehicle_rental_management_system/response/doctor_appointment/get_vehicle_appointment_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'vehicle_appointment_response_data.g.dart';

@JsonSerializable()
class VehicleAppointmentResponseData {
  bool? success;
  List<GetCompanyAppointmentResponse>? data;

  VehicleAppointmentResponseData({
    this.data,
    this.success,
  });

  factory VehicleAppointmentResponseData.fromJson(Map<String, dynamic> json) =>
      _$VehicleAppointmentResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleAppointmentResponseDataToJson(this);
}
