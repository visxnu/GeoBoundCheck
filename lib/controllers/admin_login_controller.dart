import 'dart:convert';
import 'package:attendance_management/api/http_service.dart';
import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/utilities/secure_storage.dart';
import 'package:attendance_management/utilities/utilities.dart';
import 'package:attendance_management/widgets/custom_snackbar.dart';
import 'package:attendance_management/widgets/lodaer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  var usernameController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var loginResponse = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    if (_validateFields() == true) {
      final http = HttpService();
      const detailsUrl = "";
      final Map<String, String> queryParams = {
        "action": "adminLogin",
        "username": usernameController.text,
        "password": passwordController.text
      };
      Loader.show();
      final response = await http.getRequest(detailsUrl, queryParams);
      Loader.dismiss();
      if (Utils.isSuccessResponse(response)) {
        loginResponse.value = jsonDecode(response.data);
        if (loginResponse["success"] == true) {
          _handleLoginSuccess();
        } else {
          CustomSnackBar.snackBar("Login Failed",
              "Please check entered credentials and try again.", true);
        }
      }
    }
  }

  bool _validateFields() {
    if (usernameController.text.trim().replaceAll(" ", "") == "") {
      CustomSnackBar.snackBar(
          "Error", "User email field can't be empty", false);
      return false;
    } else if (!Utils.isValidEmail(usernameController.text)) {
      CustomSnackBar.snackBar("Error", "Please enter valid email", false);
      return false;
    } else if (passwordController.text == "") {
      CustomSnackBar.snackBar("Error", "Password field can't be empty", false);
      return false;
    } else {
      return true;
    }
  }

  _handleLoginSuccess() {
    AppNavigator.offAllNamed(AppRoutes.adminHome);
    SecureStorage.saveAdminDetails(jsonEncode(loginResponse));
  }
}
