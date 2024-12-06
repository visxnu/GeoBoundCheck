import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/controllers/register_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStudentScreen extends StatelessWidget {
  final RegisterStudentController registerStudentController =
      Get.put(RegisterStudentController());

  RegisterStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/laptopuser.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.4),
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  margin: const EdgeInsets.only(top: 20),
                  color: Colors.white54,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.app_registration,
                          size: 125,
                          color: Color.fromARGB(255, 1, 255, 230),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Register Student",
                          style: TextStyle(
                              letterSpacing: 2.5,
                              fontSize: 35,
                              color: Color.fromARGB(255, 242, 245, 248),
                              fontFamily: "Lobster-Regular"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldtitle("   Student Name"),
                                customfield(
                                  'Enter Student name',
                                  registerStudentController
                                      .studentNameController,
                                  Icon(Icons.person),
                                ),
                                const SizedBox(height: 20),
                                fieldtitle("   Student Email"),
                                customfield(
                                  'Enter Email',
                                  registerStudentController.emailController,
                                  Icon(Icons.email),
                                ),
                                const SizedBox(height: 20),
                                fieldtitle("   Mobile Number"),
                                customfield(
                                  'Enter Mobile Number',
                                  registerStudentController
                                      .mobileNumberController,
                                  Icon(Icons.phone),
                                ),
                                const SizedBox(height: 20),
                                fieldtitle("   Admission Year"),
                                customfield(
                                  'Enter Admission Year',
                                  registerStudentController
                                      .admissionYearController,
                                  Icon(Icons.calendar_month),
                                ),
                                const SizedBox(height: 20),
                                fieldtitle("   Course"),
                                customfield(
                                  'Enter Course',
                                  registerStudentController.courseController,
                                  Icon(Icons.book),
                                ),
                                const SizedBox(height: 20),
                                fieldtitle("   Password"),
                                passwordfield(
                                    'Enter Password',
                                    registerStudentController
                                        .passwordController),
                                InkWell(
                                  onTap: () {
                                    registerStudentController.addNewStudent();
                                  },
                                  child: custombutton("Register"),
                                ),
                                register(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fieldtitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget customfield(String hint, TextEditingController controller, Icon icon) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              controller: controller,
              // validator: (value) {
              //   if (value == null) {
              //     return "Please Fill the Field";
              //   } else if (controller ==
              //           registerStudentController.emailController ||
              //       !value.contains("@")) {
              //     return "Please Enter Valid Email";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hint,
              ),
              onTapOutside: (e) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          )),
        ],
      ),
    );
  }

  Widget passwordfield(String hint, TextEditingController controller) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.password),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 3, left: 5),
            child: TextFormField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.blueGrey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintText: hint,
              ),
              validator: (value) {
                if (value == null) {
                  return "Please Enter Password";
                } else if (value.length < 6) {
                  return "Please Enter Strong Password";
                }
                return null;
              },
              onTapOutside: (e) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          )),
        ],
      ),
    );
  }

  Widget custombutton(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 255, 230),
          borderRadius: BorderRadius.all(Radius.circular(42))),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.2),
        ),
      ),
    );
  }

  Widget register() {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Goto Main"),
          TextButton(
            onPressed: (() {
              AppNavigator.toNamed(AppRoutes.adminHome);
            }),
            child: const Text(
              "Admin Dashboard",
              style: TextStyle(
                color: Colors.black54,
                letterSpacing: 1.5,
                fontFamily: "Lobster-Regular",
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
