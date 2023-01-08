import 'package:json_annotation/json_annotation.dart';

part "user_profile.g.dart";

@JsonSerializable()
class UserProfile {
  String? fname;
  String? lname;
  String? gender;
  String? age;
  String? username;
  String? phone;
  String? address;
  // ignore: non_constant_identifier_names

  UserProfile({
    this.fname,
    this.lname,
    this.gender,
    this.age,
    this.username,
    this.phone,
    this.address,
    // ignore: non_constant_identifier_names
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
