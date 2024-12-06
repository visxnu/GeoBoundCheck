import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/utilities/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserMainController extends GetxController {
  var currentIndex = 0.obs;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.check,
    FontAwesomeIcons.calendarDays,
  ];

  changeIndex(index) {
    currentIndex.value = index;
  }

  logout() async {
    await SecureStorage.clearStudentDetails();
    AppNavigator.offAllNamed(AppRoutes.choice);
  }
}
