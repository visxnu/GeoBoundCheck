import 'package:attendance_management/constants/app_colors.dart';
import 'package:attendance_management/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static snackBar(String? title, String? message, bool isError) {
    Get.snackbar(
      title ?? "",
      message ?? "",
      titleText: title == null
          ? Container()
          : Text(title, style: isError ? bold16Err400 : bold16Sec400),
      messageText:
          message != null ? Text(message, style: regular14sec500) : null,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: AppColors.supporting50,
      borderRadius: 10,
      duration: const Duration(seconds: 5),
      boxShadows: const [
        BoxShadow(
          color: AppColors.secondary300,
          spreadRadius: 1,
          blurRadius: 4,
        )
      ],
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
    );
  }
}
