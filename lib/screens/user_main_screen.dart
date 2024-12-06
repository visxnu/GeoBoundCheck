import 'package:attendance_management/controllers/user_main_controller.dart';
import 'package:attendance_management/screens/attendance_screen.dart';
import 'package:attendance_management/screens/view_attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMainScreen extends StatelessWidget {
  final UserMainController userMainController = Get.put(UserMainController());

  UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          userMainController.logout();
        }),
        tooltip: 'Logout',
        child: const Icon(Icons.exit_to_app),
      ),
      body: Obx(
        () => IndexedStack(
          index: userMainController.currentIndex.value,
          children: [
            AttendanceScreen(),
            ViewAttendanceScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(
          right: 12.2,
          left: 12.2,
          bottom: 24.2,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 20,
                offset: Offset(2, 2),
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0;
                  i < userMainController.navigationIcons.length;
                  i++) ...<Expanded>{
                Expanded(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        userMainController.changeIndex(i);
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              userMainController.navigationIcons[i],
                              color: i == userMainController.currentIndex.value
                                  ? const Color.fromARGB(255, 243, 10, 10)
                                  : Colors.black38,
                              size: i == userMainController.currentIndex.value
                                  ? 36
                                  : 30,
                            ),
                            userMainController.currentIndex.value == i
                                ? Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    height: 3,
                                    width: 22,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: Color.fromARGB(255, 243, 10, 10),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
