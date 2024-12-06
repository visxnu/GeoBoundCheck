import 'package:action_slider/action_slider.dart';
import 'package:attendance_management/controllers/attendance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatelessWidget {
  final AttendanceController attendanceController =
      Get.put(AttendanceController());

  AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Obx(
          () => Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 35),
                child: const Text(
                  "Attendance Portal",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => Text(
                    (attendanceController.studentDetails['data']?["email"]
                            as String?) ??
                        "",
                    style: const TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Container(
                    margin: const EdgeInsets.only(top: 18, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('hh:mm:ss a').format(DateTime.now()),
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 19),
                    ),
                  );
                },
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: DateFormat('dd ').format(DateTime.now()),
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text:
                                DateFormat('MMMM yyyy').format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ],
                    ),
                  )),
              attendanceController.turnIn.value == '--:--'
                  ? buildActionSlider('TurnIn',
                      attendanceController.turnIn.value, 'Slide to Mark TurnIn')
                  : attendanceController.turnOut.value == '--:--'
                      ? buildActionSlider(
                          'TurnOut',
                          attendanceController.turnOut.value,
                          'Slide to Mark TurnOut')
                      : Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 35),
                          child: const Text(
                            "Attendance Marked",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                        ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 35),
                child: const Text(
                  "Today's Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
              attendanceController.turnIn.value != '--:--'
                  ? buildStatusCard(
                      "In time", attendanceController.turnIn.value)
                  : Container(),
              attendanceController.turnOut.value != '--:--'
                  ? buildStatusCard(
                      "Out time", attendanceController.turnOut.value)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionSlider(String key, String time, String sliderText) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Builder(builder: (context) {
        return ActionSlider.standard(
          width: 300.0,
          actionThresholdType: ThresholdType.release,
          child: Text(sliderText),
          action: (controller) async {
            if (key == "TurnIn") {
              attendanceController.markAttendance();
            } else {
              attendanceController.postAttendanceOut();
            }
            controller.loading();
            await Future.delayed(const Duration(seconds: 3));
            controller.success();
          },
        );
      }),
    );
  }

  Widget buildStatusCard(String title, String time) {
    bool isLate = false;
    // Convert the time to a DateTime object
    if (time != "") {
      final format = DateFormat('HH:mm');
      DateTime timeAsDate = format.parse(time);

      // Check if the time is later than 8 AM
      isLate = timeAsDate.isAfter(format.parse("8:00 AM"));
    }

    return Container(
      height: 140,
      margin: const EdgeInsets.only(top: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: title == "Turn In"
                ? (isLate ? Colors.red : Colors.transparent)
                : Colors.transparent,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(95, 24, 21, 21),
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        const TextStyle(color: Colors.redAccent, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      time,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
