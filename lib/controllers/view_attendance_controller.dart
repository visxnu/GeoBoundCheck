import 'dart:convert';
import 'package:attendance_management/api/http_service.dart';
import 'package:attendance_management/utilities/secure_storage.dart';
import 'package:attendance_management/utilities/utilities.dart';
import 'package:attendance_management/widgets/lodaer.dart';
import 'package:get/get.dart';

class ViewAttendanceController extends GetxController {
  var attendanceDetails = <String, dynamic>{}.obs;
  var studentDetails = <String, dynamic>{}.obs;
  var attendanceData = [].obs;
  var studentEmail = "";
  var isFromAdmin = false.obs;

  @override
  onInit() async {
    if (Get.arguments != null && Get.arguments["student_email"] != null) {
      studentEmail = Get.arguments["student_email"] as String;
      isFromAdmin.value = true;
    } else {
      studentDetails.value =
          jsonDecode(await SecureStorage.getStudentDetails() as String);
      studentEmail = studentDetails['data']?["email"] as String;
    }
    await getAttendanceList();
    super.onInit();
  }

  getAttendanceList() async {
    final http = HttpService();
    const detailsUrl = "";
    final Map<String, String> queryParams = {
      "action": "getAttendanceByStudent",
      "student_email": studentEmail,
    };
    Loader.show();
    final response = await http.getRequest(detailsUrl, queryParams);
    Loader.dismiss();
    if (Utils.isSuccessResponse(response)) {
      attendanceData.value = [];
      attendanceDetails.value = jsonDecode(response.data);
      if (attendanceDetails["success"] == true) {
        attendanceDetails.value = jsonDecode(response.data);
        if (attendanceDetails["data"]["attendance_data"] != null) {
          attendanceDetails["data"]["attendance_data"].forEach((key, value) {
            attendanceData.add({key: value});
          });
        }
      }
    } else if (Utils.isRedirection(response)) {}
  }
}
