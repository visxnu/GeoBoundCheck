import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';

class Loader {
  // static configLoader() {
  //   EasyLoading.instance
  //     ..displayDuration = const Duration(milliseconds: 2000)
  //     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  //     ..loadingStyle = EasyLoadingStyle.custom
  //     ..indicatorSize = 45.0
  //     ..radius = 10.0
  //     ..progressColor = AppColors.primary500
  //     ..backgroundColor = AppColors.supporting50
  //     ..indicatorColor = AppColors.primary500
  //     ..textColor = AppColors.primary500
  //     ..maskType = EasyLoadingMaskType.custom
  //     ..maskColor = AppColors.secondary200.withOpacity(0.3)
  //     ..userInteractions = false
  //     ..boxShadow = const [
  //       BoxShadow(
  //         blurRadius: 3,
  //         blurStyle: BlurStyle.outer,
  //         color: AppColors.secondary200,
  //       )
  //     ]
  //     ..dismissOnTap = false;
  // }

  static show() {
    EasyLoading.show();
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
