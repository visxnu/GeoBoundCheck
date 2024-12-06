import 'package:attendance_management/constants/app_navigator.dart';
import 'package:attendance_management/constants/app_routes.dart';
import 'package:attendance_management/controllers/list_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListStudentsScreen extends StatelessWidget {
  final ListStudentController listStudentController =
      Get.put(ListStudentController());

  ListStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 48, bottom: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 18.0, left: 6, right: 6, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Student List',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Visibility(
                    visible: listStudentController.studentList.isNotEmpty,
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(180),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Container(
                            color: Colors.greenAccent,
                            child: const Center(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                          TableCell(
                              child: Container(
                            color: Colors.greenAccent,
                            child: const Center(
                              child: Text(
                                "Record",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                          // TableCell(
                          //     child: Container(
                          //   color: Colors.greenAccent,
                          //   child: const Center(
                          //     child: Text(
                          //       "Action",
                          //       style: TextStyle(
                          //         fontSize: 21,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ))
                        ]),
                        for (int i = 0;
                            i < listStudentController.studentList.length;
                            i++) ...[
                          TableRow(children: [
                            TableCell(
                                child: Container(
                              color: Colors.white24,
                              child: Center(
                                child: Text(
                                  listStudentController.studentList[i],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                            TableCell(
                                child: Container(
                              color: Colors.white24,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    AppNavigator.toNamed(
                                        AppRoutes.viewAttendance,
                                        arguments: {
                                          "student_email": listStudentController
                                              .studentList[i]
                                        });
                                  },
                                  child: const Text(
                                    "Record",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            // TableCell(
                            //     child: Container(
                            //   child: Row(
                            //     children: [
                            //       IconButton(
                            //           onPressed: () {
                            //             // Navigator.push(
                            //             //     context,
                            //             //     MaterialPageRoute(
                            //             //         builder: ((context) => updateuser(
                            //             //             id: storedocs[i]['id']))));
                            //           },
                            //           icon: const Icon(
                            //             Icons.edit,
                            //             size: 23,
                            //             color: Colors.teal,
                            //           )),
                            //       IconButton(
                            //         onPressed: () {
                            //           // deleteUser(storedocs[i]['id'] ?? '', context);
                            //           // deleteUser(1);
                            //         },
                            //         icon: const Icon(
                            //           Icons.delete,
                            //           size: 23,
                            //           color: Colors.redAccent,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ))
                          ])
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
