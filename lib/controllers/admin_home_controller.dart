import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/utilities/secure_storage.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  logout() {
    SecureStorage.clearAdminDetails();
    AppNavigator.offAllNamed(AppRoutes.choice);
  }
}
