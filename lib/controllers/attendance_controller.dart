import 'dart:convert';
import 'package:attendance_management/api/http_service.dart';
import 'package:attendance_management/constants/constants.dart';
import 'package:attendance_management/utilities/secure_storage.dart';
import 'package:attendance_management/utilities/utilities.dart';
import 'package:attendance_management/widgets/lodaer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AttendanceController extends GetxController {
  var studentDetails = <String, dynamic>{}.obs;
  var attendanceDetails = <String, dynamic>{}.obs;
  var turnIn = "--:--".obs;
  var turnOut = "--:--".obs;

  @override
  onInit() async {
    _getPermission();
    await getUserDetails();
    await getAttendanceList();
    super.onInit();
  }

  getUserDetails() async {
    studentDetails.value =
        jsonDecode(await SecureStorage.getStudentDetails() as String);
  }

  void _getPermission() async {
    PermissionStatus permission = await Permission.location.status;

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus newPermission = await Permission.location.request();

      if (newPermission == PermissionStatus.granted) {
        // Permission granted
      } else if (newPermission == PermissionStatus.denied) {
      } else if (newPermission == PermissionStatus.permanentlyDenied) {}
    }
  }

  markAttendance() async {
    // if (!(await _isWithin100m())) {
    //   throw Exception('You are not within the allowed location!');
    // }
    final http = HttpService();
    const detailsUrl = "";
    final Map<String, String> queryParams = {
      "action": "postAttendance",
    };
    final Map<String, String> data = {
      "email": studentDetails['data']?["email"] as String,
      "date": DateFormat('dd-MMM').format(DateTime.now()).toString(),
      "in": DateFormat('HH:mm').format(DateTime.now()).toString(),
      "out": ""
    };
    Loader.show();
    final response = await http.postRequest(detailsUrl, data, queryParams);
    Loader.dismiss();
    if (Utils.isSuccessResponse(response)) {
      turnIn.value = DateFormat('HH:mm').format(DateTime.now()).toString();
    } else if (Utils.isRedirection(response)) {
      turnIn.value = DateFormat('HH:mm').format(DateTime.now()).toString();
    }
  }

  postAttendanceOut() async {
    final http = HttpService();
    const detailsUrl = "";
    final Map<String, String> queryParams = {
      "action": "postAttendanceOut",
    };
    final Map<String, String> data = {
      "email": studentDetails['data']?["email"] as String,
      "date": DateFormat('dd-MMM').format(DateTime.now()).toString(),
      "in": turnIn.value,
      "out": DateFormat('HH:mm').format(DateTime.now()).toString()
    };
    Loader.show();
    final response = await http.postRequest(detailsUrl, data, queryParams);
    Loader.dismiss();
    if (Utils.isSuccessResponse(response)) {
      turnOut.value = DateFormat('HH:mm').format(DateTime.now()).toString();
    } else if (Utils.isRedirection(response)) {
      turnOut.value = DateFormat('HH:mm').format(DateTime.now()).toString();
    }
  }

  getAttendanceList() async {
    final http = HttpService();
    const detailsUrl = "";
    final Map<String, String> queryParams = {
      "action": "getAttendanceByStudent",
      "student_email": studentDetails['data']?["email"] as String,
    };
    Loader.show();
    final response = await http.getRequest(detailsUrl, queryParams);
    Loader.dismiss();
    if (Utils.isSuccessResponse(response)) {
      attendanceDetails.value = jsonDecode(response.data);
      if (attendanceDetails["success"] == true) {
        if (attendanceDetails["data"]["attendance_data"]
                        [DateFormat('dd-MMM').format(DateTime.now()).toString()]
                    ?["in"] !=
                null &&
            attendanceDetails["data"]["attendance_data"]
                        [DateFormat('dd-MMM').format(DateTime.now()).toString()]
                    ?["in"]
                .isNotEmpty) {
          turnIn.value = attendanceDetails["data"]["attendance_data"]
              [DateFormat('dd-MMM').format(DateTime.now())]["in"];
        }
        if (attendanceDetails["data"]["attendance_data"]
                        [DateFormat('dd-MMM').format(DateTime.now()).toString()]
                    ?["out"] !=
                null &&
            attendanceDetails["data"]["attendance_data"]
                        [DateFormat('dd-MMM').format(DateTime.now()).toString()]
                    ?["out"]
                .isNotEmpty) {
          turnOut.value = attendanceDetails["data"]["attendance_data"]
                      [DateFormat('dd-MMM').format(DateTime.now()).toString()]
                  ["out"]
              .toString();
        }
      }
    }
  }

  Future<bool> _isWithin100m() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final double distanceInMeters = Geolocator.distanceBetween(
      specificLat,
      specificLng,
      position.latitude,
      position.longitude,
    );
    return distanceInMeters <= 100;
  }
}
