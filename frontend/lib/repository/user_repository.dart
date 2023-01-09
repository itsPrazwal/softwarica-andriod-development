import 'dart:io';

import 'package:vehicle_rental_management_system/api/user_api.dart';
// import 'package:vehicle_rental_management_system/models/company_user.dart';
import 'package:vehicle_rental_management_system/models/company_user.dart';
import 'package:vehicle_rental_management_system/models/user_profile.dart';
import 'package:vehicle_rental_management_system/models/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> loginUser(String username, String password) async {
    return await UserApi().loginUser(username, password);
  }

  Future<User?> getUserDetails() async {
    return await UserApi().getUserDetails();
  }

  Future<bool> loginCompany(String username, String password) async {
    return await UserApi().loginCompany(username, password);
  }

  Future<bool> updateUserProfile(
      UserProfile patientProfile, File? image) async {
    return await UserApi().updateUserProfile(patientProfile, image);
  }

  Future<CompanyUser?> getCompanyProfile() async {
    return await UserApi().getCompanyProfile();
  }
}
