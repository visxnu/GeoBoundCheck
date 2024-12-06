import 'package:attendance_management/controllers/admin_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginScreen extends StatelessWidget {
  final AdminLoginController adminLoginController =
      Get.put(AdminLoginController());

  AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/laptop.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.2),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white38,
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 170,
                          color: Color.fromARGB(255, 1, 255, 230),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              letterSpacing: 2.5,
                              fontSize: 40,
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
                                fieldtitle("   User Email"),
                                customfield('Enter your Email',
                                    adminLoginController.usernameController),
                                const SizedBox(height: 20),
                                fieldtitle("   Password"),
                                passwordfield('Enter Password',
                                    adminLoginController.passwordController),
                                GestureDetector(
                                  onTap: () {
                                    adminLoginController.login();
                                  },
                                  child: custombutton("Login"),
                                ),
                                const SizedBox(height: 25),
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

  Widget customfield(String hint, TextEditingController controller) {
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.email),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3, left: 5),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: hint,
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please Enter Email";
                  }
                  return null;
                },
                onTapOutside: (e) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordfield(String hint, TextEditingController controller) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 35),
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
            child: Icon(Icons.lock),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3, left: 5),
              child: TextFormField(
                obscureText: true,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  hintText: hint,
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please Enter Password";
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget custombutton(String text) {
    return Container(
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
}
