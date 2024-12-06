import 'package:dio/dio.dart' as dio;

class Utils {
  // check the response is succuss
  static bool isSuccessResponse(dio.Response response) {
    return response.statusCode == 200;
  }

  // check the response is redirection
  static bool isRedirection(dio.Response response) {
    return response.statusCode == 302;
  }

  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidMobileNumber(String mobileNumber) {
    final RegExp mobileRegex = RegExp(r'^\d{10}$');
    return mobileRegex.hasMatch(mobileNumber);
  }
}
