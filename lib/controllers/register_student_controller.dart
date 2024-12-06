import 'dart:convert';

import 'package:attendance_management/api/http_service.dart';
import 'package:attendance_management/utilities/utilities.dart';
import 'package:attendance_management/widgets/confirmation_popup.dart';
import 'package:attendance_management/widgets/custom_snackbar.dart';
import 'package:attendance_management/widgets/lodaer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStudentController extends GetxController {
  var studentNameController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var mobileNumberController = TextEditingController(text: "");
  var admissionYearController = TextEditingController(text: "");
  var courseController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var confirmPasswordController = TextEditingController(text: "");
  var registerResponse = <String, dynamic>{}.obs;

  @override
  void dispose() {
    studentNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    admissionYearController.dispose();
    courseController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  addNewStudent() async {
    if (validateFields() == true) {
      final http = HttpService();
      const detailsUrl = "";
      final Map<String, String> queryParams = {
        "action": "registerUser",
      };
      final Map<String, String> data = {
        "student_name": studentNameController.text,
        "email": emailController.text,
        "mobile_number": mobileNumberController.text,
        "admission_year": admissionYearController.text,
        "course": courseController.text,
        "password": passwordController.text,
      };
      Loader.show();
      final response = await http.postRequest(detailsUrl, data, queryParams);
      Loader.dismiss();
      if (Utils.isSuccessResponse(response)) {
        registerResponse.value = jsonDecode(response.data);
        if (registerResponse["success"] == true) {
          _handleRegisterSuccess();
        } else {
          CustomSnackBar.snackBar(
              "Registration Failed", "Please try again later.", false);
        }
      } else if (Utils.isRedirection(response)) {
        _handleRegisterSuccess();
        // String redirectUrl = response.headers['location'][0];
        // final redirectedResponse = await http.getRequest(redirectUrl);
        // if (Utils.isSuccessResponse(redirectedResponse)) {
        //   registerResponse.value = jsonDecode(redirectedResponse.data);
        //   if (registerResponse["success"] == true) {
        //     _handleRegisterSuccess("student");
        //   } else {
        //     CustomSnackBar.snackBar(
        //         "Registration Failed", "Please try again later.", false);
        //   }
        // }
      }
    } else {
      return;
    }
  }

  bool validateFields() {
    if (studentNameController.text == "") {
      CustomSnackBar.snackBar(
          "Error", "Student name field can't be empty", false);
      return false;
    } else if (emailController.text == "") {
      CustomSnackBar.snackBar("Error", "Email field can't be empty", false);
      return false;
    } else if (!Utils.isValidEmail(emailController.text)) {
      CustomSnackBar.snackBar("Error", "Please enter valid email", false);
      return false;
    } else if (mobileNumberController.text == "") {
      CustomSnackBar.snackBar(
          "Error", "Mobile number field can't be empty", false);
      return false;
    } else if (!Utils.isValidMobileNumber(mobileNumberController.text)) {
      CustomSnackBar.snackBar(
          "Error", "Please enter valid mobile number", false);
      return false;
    } else if (admissionYearController.text == "") {
      CustomSnackBar.snackBar(
          "Error", "Admission year field can't be empty", false);
      return false;
    } else if (courseController.text == "") {
      CustomSnackBar.snackBar("Error", "Course field can't be empty", false);
      return false;
    } else if (passwordController.text == "") {
      CustomSnackBar.snackBar("Error", "Password field can't be empty", false);
      return false;
    } else if (passwordController.text.length < 8) {
      CustomSnackBar.snackBar(
          "Error", "Password needs to be at least 8 characters.", false);
      return false;
    } else {
      return true;
    }
  }

  _handleRegisterSuccess() {
    ConfirmationPopup.showSimpleCloseDialogPopUp(
        mainTitle: "Student Account Created Successfully",
        descriptionWidget: const Text(
            'Please share the password and student email as credentials to student for login'));
    _clearTextFields();
  }

  _clearTextFields() {
    studentNameController.text = "";
    emailController.text = "";
    mobileNumberController.text = "";
    admissionYearController.text = "";
    courseController.text = "";
    passwordController.text = "";
    confirmPasswordController.text = "";
  }
}
