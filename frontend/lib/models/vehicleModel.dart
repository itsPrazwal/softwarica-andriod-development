import 'package:json_annotation/json_annotation.dart';

class VehicleModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? department;
  String? picture;

  VehicleModel({
    this.id,
    this.name,
    this.department,
    this.picture,
  });

  // converting to dart object from server json file
  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["_id"],
        name: json["name"],
        department: json["department"],
        picture: json["picture"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "department": department,
        "picture": picture,
      };
}
