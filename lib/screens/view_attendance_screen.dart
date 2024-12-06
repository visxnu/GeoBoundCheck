import 'package:attendance_management/controllers/view_attendance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAttendanceScreen extends StatelessWidget {
  final ViewAttendanceController viewAttendanceController =
      Get.put(ViewAttendanceController());

  ViewAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          viewAttendanceController.getAttendanceList();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 35, bottom: 13),
                child: const Text(
                  "Attendance Portal",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  alignment: Alignment.center,
                  child: Text(
                    viewAttendanceController.isFromAdmin.value == false
                        ? "My Attendance"
                        : "Attendance",
                    style: const TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
              // Stack(children: [
              //   Container(
              //     padding: const EdgeInsets.only(top: 10),
              //     alignment: Alignment.centerLeft,
              //     child: const Text(
              //       "",
              //       style: TextStyle(
              //           color: Color.fromARGB(255, 245, 4, 4), fontSize: 22),
              //     ),
              //   ),
              // Container(
              //   padding: const EdgeInsets.only(
              //     top: 10,
              //   ),
              //   alignment: Alignment.centerRight,
              //   child: GestureDetector(
              //     onTap: () async {
              //       final month = await showMonthYearPicker(
              //         context: context,
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(2022),
              //         lastDate: DateTime(2085),
              //         builder: (context, child) {
              //           return Theme(
              //             data: Theme.of(context).copyWith(
              //                 colorScheme: const ColorScheme.light(
              //                     primary: Colors.redAccent,
              //                     secondary: Colors.redAccent,
              //                     onSecondary: Colors.white),
              //                 textButtonTheme: TextButtonThemeData(
              //                     style: TextButton.styleFrom(
              //                         foregroundColor: Colors.redAccent))),
              //             child: child!,
              //           );
              //         },
              //       );

              //       if (month != null) {
              //         // setState(() {
              //         //   _month = DateFormat('MMMM').format(month);
              //         // });
              //       }
              //     },
              //     child: const Text(
              //       "Choose Month",
              //       style: TextStyle(color: Colors.black, fontSize: 22),
              //     ),
              //   ),
              // ),
              // ]),
              // FutureBuilder<QuerySnapshot>(
              //   future: FirebaseFirestore.instance
              //       .collection("Employee")
              //       .doc(user.id)
              //       .collection("Record")
              //       .get(),
              //   builder:
              //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       if (snapshot.hasError) {
              //         return const SizedBox(
              //           child: Text("Error Receiving Data"),
              //         );
              //       }
              //       final snap = snapshot.data!.docs;
              //       final filteredSnap = snap.where((doc) =>
              //           DateFormat('MMMM').format(doc['Date'].toDate()) == _month);

              //       attendedDays = filteredSnap.length;

              //       return
              Obx(
                () => viewAttendanceController.attendanceData.isNotEmpty
                    ? Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                viewAttendanceController.attendanceData.length,
                            itemBuilder: (context, index) {
                              var item = viewAttendanceController.attendanceData
                                  .elementAt(index);
                              return Container(
                                height: 125,
                                margin: const EdgeInsets.only(
                                    top: 17, right: 8, left: 8, bottom: 6),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(95, 24, 21, 21),
                                        blurRadius: 10,
                                        offset: Offset(2, 2),
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Container(
                                        margin: const EdgeInsets.only(),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          color: Colors.redAccent,
                                        ),
                                        child: Center(
                                          child: Text(
                                            item.entries.first.key ?? "--",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "In time",
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 18),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                item[item.entries.first.key]
                                                                ["in"] !=
                                                            null &&
                                                        item[item.entries.first
                                                                .key]["in"]
                                                            .isNotEmpty
                                                    ? item[item.entries.first
                                                        .key]["in"]
                                                    : "--:--",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Out time",
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 18),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                item[item.entries.first.key]
                                                                ["out"] !=
                                                            null &&
                                                        item[item.entries.first
                                                                .key]["out"]
                                                            .isNotEmpty
                                                    ? item[item.entries.first
                                                        .key]["out"]
                                                    : "--:--",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Attendance Report",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 28)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Total attended days: ${viewAttendanceController.attendanceData.length}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      )
                    : const Text("No data to show.",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
