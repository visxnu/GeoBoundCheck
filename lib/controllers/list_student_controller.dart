import 'dart:convert';
import 'package:attendance_management/api/http_service.dart';
import 'package:attendance_management/utilities/utilities.dart';
import 'package:attendance_management/widgets/lodaer.dart';
import 'package:get/get.dart';

class ListStudentController extends GetxController {
  var studentList = <String>[].obs;

  @override
  onInit() {
    getStudentList();
    super.onInit();
  }

  getStudentList() async {
    final http = HttpService();
    const detailsUrl = "";
    final Map<String, String> queryParams = {
      "action": "getStudentList",
    };
    Loader.show();
    final response = await http.getRequest(detailsUrl, queryParams);
    Loader.dismiss();
    if (Utils.isSuccessResponse(response)) {
      if (jsonDecode(response.data)["success"] == true) {
        studentList.value =
            (jsonDecode(response.data)["data"]["user"] as String).split(",");
      }
    }
  }
}
