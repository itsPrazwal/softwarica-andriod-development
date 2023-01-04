import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_system/api/http_services.dart';
import 'package:vehicle_rental_management_system/models/appointment_hdt_model.dart';
import 'package:vehicle_rental_management_system/models/book_appointment.dart';
import 'package:vehicle_rental_management_system/models/book_vehicle_appointment.dart';
import 'package:vehicle_rental_management_system/models/companyModel.dart';
import 'package:vehicle_rental_management_system/models/vehicle_category.dart';
import 'package:vehicle_rental_management_system/models/vehicleModel.dart';
import 'package:vehicle_rental_management_system/response/appointment_hdt_response.dart';
import 'package:vehicle_rental_management_system/response/appointment_response.dart';
import 'package:vehicle_rental_management_system/response/book_appointment_response.dart';
import 'package:vehicle_rental_management_system/response/doctor_appointment/company_appointment_response.dart';
import 'package:vehicle_rental_management_system/response/doctor_appointment/vehicle_appointment_response_data.dart';
import 'package:vehicle_rental_management_system/response/doctor_appointment/get_vehicle_appointment_response.dart';
import 'package:vehicle_rental_management_system/response/doctor_appointment/vehicle_appointment_response.dart';
import 'package:vehicle_rental_management_system/response/doctor_ui_appointment/company_ui_appointment.dart';
import 'package:vehicle_rental_management_system/response/doctor_ui_appointment/get_company_ui_appointment.dart';
import 'package:vehicle_rental_management_system/response/vehicle_category_id.dart';
import 'package:vehicle_rental_management_system/response/vehicle_category_response.dart';
import 'package:vehicle_rental_management_system/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAPI {
  Future<List<VehicleCategory?>> loadVehicleCategory() async {
    List<VehicleCategory?> healthCateogryList = [];
    Response response;
    var url = baseUrl + getVehicleCategoryUrl;

    var dio = HttpServices().getDioInstance();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    try {
      response = await dio.get(
        url,
        options: buildCacheOptions(const Duration(days: 7)),
      );
      debugPrint(response.toString());

      if (response.statusCode == 201) {
        VehicleCategoryResponse healthCategoryResponse =
            VehicleCategoryResponse.fromJson(response.data);

        for (var data in healthCategoryResponse.data!) {
          healthCateogryList.add(
            VehicleCategory(
              id: data.id,
              name: data.name,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return healthCateogryList;
  }

  Future<List<AppointmentHDTModel?>> loadBookedHDT(String vehicleCategoryID) async {
    List<AppointmentHDTModel?> appointmentHDTList = [];
    Response response;
    var url = baseUrl + getAppointmentHDT;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url + vehicleCategoryID);

      if (response.statusCode == 201) {
        AppointmentHDTResponse appointmentHDTResponse =
            AppointmentHDTResponse.fromJson(response.data);

        for (var data in appointmentHDTResponse.data!) {
          appointmentHDTList.add(
            AppointmentHDTModel(
              id: data.id,
              vehicleCategoryID: data.vehicleCategoryID,
              date: data.date,
              time: data.time,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return appointmentHDTList;
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    List<AppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API Response :" + response.data.toString());
      if (response.statusCode == 201) {
        BookAppointmentResponse bookAppointmentResponse =
            BookAppointmentResponse.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(AppointmentResponse(
            appointmentFor: data.appointmentFor,
            category: data.category,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            id: data.id,
            mobile: data.mobile,
            patientId: data.patientId,
            time: data.time,
            visitPurpose: data.visitPurpose,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> deleteTime(
      String vehicleCategoryID, String date, String time) async {
    bool isDeleted = false;
    Response response;
    String url = baseUrl + deleteAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      response = await dio.put(
        url,
        data: {
          "vehicleCategoryID": vehicleCategoryID,
          "date": date,
          "time": time,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> reAddAppointmentTime(
      String vehicleCategoryID, String date, String time) async {
    bool? isAdded = false;
    String url = baseUrl + reAddAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.put(
        url + vehicleCategoryID,
        data: {
          "date": date,
          "time": time,
        },
      );
      // debugPrint("Response: " + response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isAdded;
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    bool isUpdated = false;
    Response response;
    String url = baseUrl + updateAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    debugPrint(appointmentResponse.id);
    debugPrint(appointmentResponse.fullname);
    debugPrint(appointmentResponse.mobile);
    debugPrint(appointmentResponse.email);
    debugPrint(appointmentResponse.appointmentFor);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      response = await dio.put(
        url + appointmentResponse.id!,
        data: {
          "fullname": appointmentResponse.fullname,
          "mobile": appointmentResponse.mobile,
          "email": appointmentResponse.email,
          "appointmentFor": appointmentResponse.appointmentFor,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isUpdated;
  }

  Future<VehicleCategory?> getvehicleCategoryId(String name) async {
    String url = baseUrl + getVehicleCateogryIdUrl;
    Dio dio = HttpServices().getDioInstance();
    VehicleCategory? healthCategory;
    try {
      Response response = await dio.get(url + name);
      // debugPrint("datadddddddddddddddddddddd" + response.data.toString());

      if (response.statusCode == 200) {
        VehicleCategoryId vehicleCategoryID =
            VehicleCategoryId.fromJson(response.data);

        healthCategory = VehicleCategory.fromJson(vehicleCategoryID.data);
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return healthCategory;
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }


  // -----------------------------Vehicle Part Started----------------------------------------
  Future<List<VehicleModel?>> loadDepartmentVehicle(String department) async {
    List<VehicleModel?> vehicleAppointmentList = [];
    Response response;
    var url = baseUrl + getDepartmentVehicle;

    var dio = HttpServices().getDioInstance();
    // debugPrint(department);
    try {
      response = await dio.get(url + department);
      debugPrint("Vehicle Response" + response.data.toString());

      if (response.statusCode == 200) {
        VehicleAppointmentResponse vehicleAppointmentResponse =
            VehicleAppointmentResponse.fromJson(response.data);
        // debugPrint(vehicleAppointmentResponse.details![0].toString());

        for (var data in vehicleAppointmentResponse.details!) {
          vehicleAppointmentList.add(
            VehicleModel(
              id: data.id,
              name: data.name,
              department: data.department,
              picture: data.picture,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get Department:::: $e');
    }
    // debugPrint(vehicleAppointmentList.toString());
    return vehicleAppointmentList;
  }
  // -----------------------------Doctor Part Started---------------------------------------------------------------------------
  Future<List<CompanyModel?>> loadDepartmentCompany(String department) async {
    List<CompanyModel?> doctorAppointmentList = [];
    Response response;
    var url = baseUrl + getDepartmentCompany;

    var dio = HttpServices().getDioInstance();
    // debugPrint(department);
    try {
      response = await dio.get(url + department);
      // debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        CompanyAppointmentResponse doctorAppointmentResponse =
            CompanyAppointmentResponse.fromJson(response.data);
        // debugPrint(doctorAppointmentResponse.details![0].toString());

        for (var data in doctorAppointmentResponse.details!) {
          doctorAppointmentList.add(
            CompanyModel(
              id: data.id,
              fname: data.fname,
              lname: data.lname,
              gender: data.gender,
              age: data.age,
              username: data.username,
              email: data.email,
              phone: data.phone,
              address: data.address,
              password: data.password,
              department: data.department,
              picture: data.picture,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get Department:::: $e');
    }
    // debugPrint(doctorAppointmentList.toString());
    return doctorAppointmentList;
  }

  Future<bool> bookCompanyAppointment(BookVehicleAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookCompanyAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<List<GetCompanyAppointmentResponse?>>
      getBookedCompanyAppointment() async {
    List<GetCompanyAppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedCompanyAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API Response :..." + response.data.toString());
      if (response.statusCode == 200) {
        VehicleAppointmentResponseData bookAppointmentResponse =
            VehicleAppointmentResponseData.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(GetCompanyAppointmentResponse(
            id: data.id,
            patientId: data.patientId,
            doctorId: data.doctorId,
            endDate: data.endDate,
            startDate: data.startDate,
            email: data.email,
            fullname: data.fullname,
            mobile: data.mobile,
            vehicleId: data.vehicleId,
            // time: data.time,
            status: data.status,
            department: data.department,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> deleteCompanyAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteBookedCompanyAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> updateCompanyAppointment(
      GetCompanyAppointmentResponse appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + updateCompanyAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      debugPrint(appointment.startDate);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.put(
        url + appointment.id!,
        data: {
          "fullname": appointment.fullname,
          "mobile": appointment.mobile,
          "email": appointment.email,
          "startDate": appointment.startDate,
          "endDate": appointment.endDate,

        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  // -------------------------------- Doctor UI part API ----------------------------------------------------------------------

  Future<List<GetCompanyUIAppointment?>> getCompanyUIAppointment(
      String status) async {
    List<GetCompanyUIAppointment?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + companyAppointmentStatusUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("doctor");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url + status,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API UI Response :" + response.data.toString());
      if (response.statusCode == 200) {
        CompanyUIAppointment bookAppointmentResponse =
            CompanyUIAppointment.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(GetCompanyUIAppointment(
            id: data.id,
            patientId: data.patientId,
            doctorId: data.doctorId,
            startDate: data.startDate,
            email: data.email,
            fullname: data.fullname,
            mobile: data.mobile,
            endDate: data.endDate,
            status: data.status,
            department: data.department,
            vehicleId: data.vehicleId,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> updateCompanyUIAppointment(String id, String status) async {
    bool isUpdated = false;
    Response response;
    String? url = baseUrl + companyAppointmentUpdateStatusUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("doctor");
      debugPrint("Token: " + token!);
      var data = {"appointmentStatus": status};
      response = await dio.put(
        url + id,
        data: data,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error in Updating appointment");
    }
    return isUpdated;
  }
}
