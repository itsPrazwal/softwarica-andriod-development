import 'package:vehicle_rental_management_system/models/vehicleModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'vehicle_appointment_response.g.dart';

@JsonSerializable()
class VehicleAppointmentResponse {
  List<VehicleModel>? details;

  VehicleAppointmentResponse({this.details});

  factory VehicleAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleAppointmentResponseToJson(this);
}
