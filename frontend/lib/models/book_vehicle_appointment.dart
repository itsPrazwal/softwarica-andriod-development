import 'package:json_annotation/json_annotation.dart';
part 'book_vehicle_appointment.g.dart';

@JsonSerializable()
class BookVehicleAppointment {
  String? department;
  String? startDate;
  String? endDate;
  String? time;
  String? fullname;
  String? mobile;
  String? email;
  String? doctorId;
  String? vehicleId;

  BookVehicleAppointment({
    this.department,
    this.startDate,
    this.endDate,
    this.time,
    this.email,
    this.fullname,
    this.mobile,
    this.doctorId,
    this.vehicleId,
  });

  factory BookVehicleAppointment.fromJson(Map<String, dynamic> json) =>
      _$BookVehicleAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$BookVehicleAppointmentToJson(this);
}
