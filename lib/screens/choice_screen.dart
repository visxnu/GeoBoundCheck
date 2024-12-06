import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/controllers/choice_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoiceScreen extends StatelessWidget {
  final ChoiceScreenController choiceScreenController =
      Get.put(ChoiceScreenController());

  ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(1.0, 5.0),
                colors: [Colors.white, Colors.teal],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      margin: const EdgeInsets.all(16.0),
                      child: professorLogo,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 16.0, left: 16.0, right: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.teal,
                      elevation: 20.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      ),
                    ),
                    onPressed: () {
                      AppNavigator.toNamed(AppRoutes.adminLogin);
                    },
                    child: const Text(
                      "I am Admin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      margin: const EdgeInsets.all(16.0),
                      child: studentLogo,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 16.0, left: 16.0, right: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.teal,
                      elevation: 20.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60.0)),
                      ),
                    ),
                    onPressed: () {
                      AppNavigator.toNamed(AppRoutes.studentLogin);
                    },
                    child: const Text(
                      "I am Student",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  final professorLogo = Hero(
    tag: 'I am Admin',
    child: CircleAvatar(
      child: Container(
        width: 135.0,
        height: 135.0,
        decoration: const BoxDecoration(
          color: Color(0xff7c94b6),
          image: DecorationImage(
            image: AssetImage("assets/admin1.jpg"),
          ),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
      ),
    ),
  );

  final studentLogo = Hero(
    tag: 'I am Employee',
    child: CircleAvatar(
      child: Container(
        width: 135.0,
        height: 135.0,
        decoration: const BoxDecoration(
          color: Color(0xff7c94b6),
          image: DecorationImage(
            image: AssetImage("assets/std.png"),
          ),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
      ),
    ),
  );
}
