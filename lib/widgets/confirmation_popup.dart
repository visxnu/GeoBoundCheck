import 'dart:ui';

import 'package:attendance_management/constants/app_colors.dart';
import 'package:attendance_management/constants/spacing.dart';
import 'package:attendance_management/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationPopup {
  static Future<bool> showSimpleCloseDialogPopUp(
      {String? mainTitle,
      Widget? descriptionWidget,
      Widget? subTitleWidget,
      bool barrierDismissible = true}) async {
    final alert = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        actionsPadding: const EdgeInsets.all(0),
        shadowColor: Colors.transparent,
        actions: [
          Container(
            padding: const EdgeInsets.all(Spacing.spacing04),
            decoration: BoxDecoration(
              color: AppColors.supporting50,
              border: Border.all(width: 2, color: AppColors.secondary200),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.secondary200,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2))
              ],
            ),
            child: InkWell(
              onTap: () async {
                Get.back(result: true);
              },
              child: Column(
                children: [
                  Visibility(
                    visible: subTitleWidget != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainTitle ?? "",
                          style: bold16Sec500,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 20),
                          child: Container(
                            height: 1,
                            color: AppColors.secondary200,
                          ),
                        ),
                        subTitleWidget ?? Container(),
                      ],
                    ),
                  ),
                  descriptionWidget ?? Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      height: 1,
                      color: AppColors.secondary200,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(Get.context!).size.width * 0.30,
                    child: TextButton(
                      onPressed: () {
                        Get.back(result: true);
                      },
                      child: const Text("Close"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return await Get.dialog<bool>(alert,
            barrierColor: Colors.transparent,
            barrierDismissible: barrierDismissible) ??
        true;
  }
}
