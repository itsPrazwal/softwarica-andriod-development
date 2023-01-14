import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle_rental_management_system/models/user.dart';
import 'package:vehicle_rental_management_system/repository/user_repository.dart';

void main() {
  late UserRepository? userRepository;
  String? token;

  setUp(() {
    userRepository = UserRepository();
    token = "";
  });
  group("User Tests", () {
    test("user registration", () async {
      bool? expectedResult = true;
      User user = User(
        fname: "Prajwal",
        lname: "Malakar",
        gender: "male",
        age: "21",
        username: "wiZZarD51",
        email: "PM4@g.com",
        phone: "9840171407",
        address: "Sankhamul",
        password: "prajwal123",
      );
      bool actualResult = await userRepository!.registerUser(user);
      expect(expectedResult, actualResult);
    });

    test("user login", () async {
      bool? expectedResult = true;
      String? email = "malakar";
      String? password = "kandel";
      bool actualResult = await userRepository!.loginUser(email, password);
      expect(expectedResult, actualResult);
    });

    test("Doctor login", () async {
      bool? expectedResult = true;
      String? email = "prajwal@gmail.com";
      String? password = "shishir";
      bool actualResult = await userRepository!.loginCompany(email, password);
      expect(expectedResult, actualResult);
    });
  });

  tearDown(() {
    userRepository = null;
  });
}
