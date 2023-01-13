import 'package:vehicle_rental_management_system/api/category_api.dart';
import 'package:vehicle_rental_management_system/models/appointment_hdt_model.dart';
import 'package:vehicle_rental_management_system/models/book_appointment.dart';
import 'package:vehicle_rental_management_system/models/book_vehicle_appointment.dart';
import 'package:vehicle_rental_management_system/models/companyModel.dart';
import 'package:vehicle_rental_management_system/models/vehicle_category.dart';
import 'package:vehicle_rental_management_system/models/vehicleModel.dart';
import 'package:vehicle_rental_management_system/response/appointment_response.dart';
import 'package:vehicle_rental_management_system/response/doctor_appointment/get_vehicle_appointment_response.dart';
import 'package:vehicle_rental_management_system/response/doctor_ui_appointment/get_company_ui_appointment.dart';

class CategoryRepository {
  Future<List<VehicleCategory?>> loadVehicleCategory() {
    return CategoryAPI().loadVehicleCategory();
  }

  Future<List<AppointmentHDTModel?>> loadBookedHDT(String vehicleCategoryID) {
    return CategoryAPI().loadBookedHDT(vehicleCategoryID);
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    return await CategoryAPI().bookAppointment(appointment);
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    return await CategoryAPI().getBookedAppointment();
  }

  Future<bool> deleteTime(
      String vehicleCategoryID, String date, String time) async {
    return await CategoryAPI().deleteTime(vehicleCategoryID, date, time);
  }

  Future<bool> reAddAppointmentTime(
      String vehicleCategoryID, String date, String time) async {
    return await CategoryAPI()
        .reAddAppointmentTime(vehicleCategoryID, date, time);
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    return await CategoryAPI().updateAppointment(appointmentResponse);
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    return await CategoryAPI().deleteAppointment(appointmentId);
  }

  Future<VehicleCategory?> getvehicleCategoryId(String name) async {
    return await CategoryAPI().getvehicleCategoryId(name);
  }

  Future<List<CompanyModel?>> loadDepartmentCompany(String department) {
    return CategoryAPI().loadDepartmentCompany(department);
  }

  Future<List<VehicleModel?>> loadDepartmentVehicle(String department) {
    return CategoryAPI().loadDepartmentVehicle(department);
  }

  Future<bool> bookCompanyAppointment(BookVehicleAppointment appointment) async {
    return await CategoryAPI().bookCompanyAppointment(appointment);
  }

  Future<List<GetCompanyAppointmentResponse?>>
      getBookedCompanyAppointment() async {
    return await CategoryAPI().getBookedCompanyAppointment();
  }

  Future<bool> deleteCompanyAppointment(String appointmentId) async {
    return await CategoryAPI().deleteCompanyAppointment(appointmentId);
  }

  Future<bool> updateCompanyAppointment(
      GetCompanyAppointmentResponse appointment) async {
    return await CategoryAPI().updateCompanyAppointment(appointment);
  }

  Future<List<GetCompanyUIAppointment?>> getCompanyUIAppointment(
      String status) async {
    return await CategoryAPI().getCompanyUIAppointment(status);
  }

  Future<bool> updateCompanyUIAppointment(String id, String status) async {
    return await CategoryAPI().updateCompanyUIAppointment(id, status);
  }

}
