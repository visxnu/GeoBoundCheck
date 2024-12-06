import 'package:shared_preferences/shared_preferences.dart';

const keyStudentDetails = 'student_details';
const keyAdminDetails = 'admin_details';
const keyIsStudentLoggedIn = 'is_student_logged_in';
const keyIsAdminLoggedIn = 'is_admin_logged_in';

class SecureStorage {
  // save user data on login
  static Future saveStudentDetails(String studentDetailsValue) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyIsStudentLoggedIn, true);
    return await prefs.setString(keyStudentDetails, studentDetailsValue);
  }

  // read student details from preferences
  static Future<String?> getStudentDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString(keyStudentDetails);
  }

  // get if student is logged in
  static Future<bool?> isStudentLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(keyIsStudentLoggedIn);
  }

  // clear student details when logout
  static Future clearStudentDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsStudentLoggedIn, false);
    return await prefs.remove(keyStudentDetails);
  }

  // save admin data on login
  static Future saveAdminDetails(String adminDetailsValue) async {
    // SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsAdminLoggedIn, true);
    return await prefs.setString(keyAdminDetails, adminDetailsValue);
  }

  // read admin details from preferences
  static Future<String?> getAdminDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString(keyAdminDetails);
  }

  // get if admin is logged in
  static Future<bool?> isAdminLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(keyIsAdminLoggedIn);
  }

  // clear admin details when logout
  static Future clearAdminDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsAdminLoggedIn, false);
    return await prefs.remove(keyAdminDetails);
  }
}
