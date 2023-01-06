import 'package:json_annotation/json_annotation.dart';

class UserModel {
  @JsonKey(name: "_id")
  String? id;
  String? fname;
  String? lname;
  String? gender;
  String? age;
  String? username;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? picture;

  UserModel({
    this.id,
    this.fname,
    this.lname,
    this.gender,
    this.age,
    this.username,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.picture,
  });

  // converting to dart object from server json file
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        fname: json["fname"],
        lname: json["lname"],
        gender: json["gender"],
        age: json["age"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        password: json["password"],
        picture: json["picture"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "_id": id,
        "fname": fname,
        "lname": lname,
        "gender": gender,
        "age": age,
        "username": username,
        "email": email,
        "phone": phone,
        "address": address,
        "password": password,
        "picture": picture,
      };
}
