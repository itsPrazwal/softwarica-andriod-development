import 'package:json_annotation/json_annotation.dart';
part 'appointment_hdt_model.g.dart';

@JsonSerializable()
class AppointmentHDTModel {
  @JsonKey(name: "_id")
  String? id;
  String? vehicleCategoryID;
  String? date;
  List<String?> time;

  AppointmentHDTModel(
      {this.id, this.vehicleCategoryID, this.date, required this.time});

  factory AppointmentHDTModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHDTModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentHDTModelToJson(this);
}
