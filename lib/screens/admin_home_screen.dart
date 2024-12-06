import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/controllers/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  final AdminHomeController adminHomeController =
      Get.put(AdminHomeController());

  AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          adminHomeController.logout();
        }),
        tooltip: 'Logout',
        child: const Icon(Icons.exit_to_app),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 65, bottom: 10),
              alignment: Alignment.bottomCenter,
              child: const Text(
                "Dashboard",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            GestureDetector(
              onTap: (() {
                AppNavigator.toNamed(AppRoutes.registerStudent);
              }),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                // shadowColor: Colors.black12,
                margin: const EdgeInsets.only(
                    top: 35, bottom: 14, right: 10, left: 10),
                color: Colors.white54,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      margin: const EdgeInsets.all(16.0),
                      child: const Icon(
                        Icons.person_add,
                        size: 95,
                        color: Colors.teal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(42))),
                      child: const Center(
                        child: Text(
                          "Register Student",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                AppNavigator.toNamed(AppRoutes.listStudent);
              }),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                // shadowColor: Colors.black12,
                margin: const EdgeInsets.only(
                    top: 35, bottom: 20, right: 10, left: 10),
                color: Colors.white54,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      margin: const EdgeInsets.all(16.0),
                      child: const Icon(
                        Icons.data_object,
                        size: 95,
                        color: Colors.teal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(42))),
                      child: const Center(
                        child: Text(
                          "View Record",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
