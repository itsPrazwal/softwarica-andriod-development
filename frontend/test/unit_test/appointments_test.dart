import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_rental_management_system/models/vehicle_category.dart';
import 'package:vehicle_rental_management_system/repository/category_repository.dart';

void main() {
  String? token;
  setUp(() {
    token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwSUQiOiI2M2JlNzBiYjQ5YjNlYTFhNTkxOGFmNzIiLCJpYXQiOjE2NzM3Nzc5OTN9.dIfCMToYyftETqiwcdthzCUn-D7EajxofknJ9yOsAmo";
  });

  test("show Category", () async {
    String? expectedResult = "BIKE";
    debugPrint(expectedResult);

    List<VehicleCategory?> actualResultList =
        await CategoryRepository().loadVehicleCategory();
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[0]!.name;
    expect(expectedResult, actualResult);
  });

  test("show Department", () async {
    String? expectedResult = "CAR";
    debugPrint(expectedResult);

    List<VehicleCategory?> actualResultList =
        await CategoryRepository().loadVehicleCategory();
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[1]!.name;
    expect(expectedResult, actualResult);
  });

  // test("show Date", () async {
  //   String? expectedResult = "Tuesday, 24 December, 2021";
  //   debugPrint(expectedResult);
  //   String hcId = "62b491ca29d24b17c62174d8";

  //   List<AppointmentHDTModel?> actualResultList =
  //       await CategoryRepository().loadBookedHDT(hcId);
  //   debugPrint(expectedResult);

  //   debugPrint(actualResultList.toString());
  //   String? actualResult = actualResultList[0]!.date;
  //   expect(expectedResult, actualResult);
  // });
}
