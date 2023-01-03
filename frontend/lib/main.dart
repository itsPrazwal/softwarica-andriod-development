import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_system/screens/book_doctor_appointment/appointment_details_screen.dart';
import 'package:vehicle_rental_management_system/screens/book_doctor_appointment/search_select_vehicle.dart';
import 'package:vehicle_rental_management_system/screens/book_doctor_appointment/select_department.dart';
import 'package:vehicle_rental_management_system/screens/bottom_nav_bar.dart';
import 'package:vehicle_rental_management_system/screens/home_screen.dart';
import 'package:vehicle_rental_management_system/screens/login_page.dart';
import 'package:vehicle_rental_management_system/screens/user_profile_update.dart';
import 'package:vehicle_rental_management_system/screens/register_page.dart';
import 'package:vehicle_rental_management_system/screens/splash_screen.dart';
import 'package:vehicle_rental_management_system/screens/update_appointment.dart';
import 'package:vehicle_rental_management_system/screens/update_vehicle_appointment.dart';
import 'package:vehicle_rental_management_system/screens/wear_os_screens/wear_apt.dart';
import 'package:vehicle_rental_management_system/screens/wear_os_screens/wear_doc_apt.dart';
import 'package:vehicle_rental_management_system/screens/wear_os_screens/wear_login.dart';
//11373513
void main() {
  AwesomeNotifications().initialize(
    "",
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.transparent,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  runApp(
    MaterialApp(
      // theme: ThemeData(fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/doctorDepartmentScreen',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/login': (context) => const LoginPageScreen(),
        '/registerPage': (context) => const RegisterPageScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        // '/healthCategoryScreen': (context) => const VehicleCategoryScreen(),
        // '/dateScreen': (context) => const AppointmentDateScreen(),
        // '/appointmentDetailScreen': (context) =>
        //     const AppointmentDetailsScreen(),
        "/updateAppointmentScreen": (context) =>
            const UpdateAppointmentScreen(),
        '/doctorDepartmentScreen': (context) => const VehicleDepartmentScreen(),
        '/searchDoctor': (context) => const SearchVehicle(),
        '/appointmentCompanyDetailsScreen': (context) =>
            const AppointmentVehicleDetailsScreen(),
        '/updateAppointmentDoctor': (context) =>
            const UpdateAppointmentVehicle(),
        '/patientProfileUpdate': (context) => const UserProfileUpdate(),

        // Wear OS
        '/wearLogin': (context) => const WearOsLogin(),
        "/wearApt": (context) => const WearAppointment(),
        '/wearDocApt': (context) => const WearCompanyAppointment(),
      },
    ),
  );
}
