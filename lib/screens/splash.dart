import 'dart:async';

import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/utilities/secure_storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  void handleTimeout() async {
    if (await SecureStorage.isStudentLoggedIn() == true) {
      AppNavigator.offAllNamed(AppRoutes.studentMain);
    } else if (await SecureStorage.isAdminLoggedIn() == true) {
      AppNavigator.offAllNamed(AppRoutes.adminHome);
    } else {
      AppNavigator.offAllNamed(AppRoutes.choice);
    }
  }

  startTimeout() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));

    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Center(
              child: Image.asset(
        "assets/splash.jpg",
        width: _iconAnimation.value * 280,
        height: _iconAnimation.value * 280,
      ))),
    );
  }
}
