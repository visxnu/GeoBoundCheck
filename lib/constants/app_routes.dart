import 'package:attendance_management/screens/admin_home_screen.dart';
import 'package:attendance_management/screens/admin_login_screen.dart';
import 'package:attendance_management/screens/attendance_screen.dart';
import 'package:attendance_management/screens/choice_screen.dart';
import 'package:attendance_management/screens/list_students_screen.dart';
import 'package:attendance_management/screens/register_student_screen.dart';
import 'package:attendance_management/screens/splash.dart';
import 'package:attendance_management/screens/student_login_screen.dart';
import 'package:attendance_management/screens/user_main_screen.dart';
import 'package:attendance_management/screens/view_attendance_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = "/";
  static const splash = "/splash";
  static const choice = "/choice";
  static const studentLogin = "/user_login";
  static const adminLogin = "/admin_login";
  static const adminHome = "/admin_home";
  static const registerStudent = "/register_student";
  static const listStudent = "/list_student";
  static const studentMain = "/student_main";
  static const attendance = "/attendance";
  static const viewAttendance = "/view_attendance";

  static List<GetPage> allPages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: choice, page: () => ChoiceScreen()),
    GetPage(name: studentLogin, page: () => StudentLoginScreen()),
    GetPage(name: adminLogin, page: () => AdminLoginScreen()),
    GetPage(name: adminHome, page: () => AdminHomeScreen()),
    GetPage(name: registerStudent, page: () => RegisterStudentScreen()),
    GetPage(name: listStudent, page: () => ListStudentsScreen()),
    GetPage(name: studentMain, page: () => UserMainScreen()),
    GetPage(name: attendance, page: () => AttendanceScreen()),
    GetPage(name: viewAttendance, page: () => ViewAttendanceScreen()),
  ];
}
