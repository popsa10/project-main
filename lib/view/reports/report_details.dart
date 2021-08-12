import 'package:flutter/material.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/shared/components.dart';

class Report_Details extends StatefulWidget {
  Reports reports;


  Report_Details(this.reports);

  @override
  _Report_DetailsState createState() => _Report_DetailsState();
}

class _Report_DetailsState extends State<Report_Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: myCustomAppBar(
        context: context,
        title: 'Report Details',
        canPop: true,
        haveBell: true,
        haveNotf: true,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: custom_row(title: 'Report Date', val: widget.reports.createdAt.substring(0,10)),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                        topEnd: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.reports.location!=null? custom_row(title: 'Location', val: widget.reports.location.location):SizedBox(),
                      custom_row(title: 'Target', val: widget.reports.target),
                      widget.reports.approveuser!=null?custom_row(title: 'Report Approved by', val: widget.reports.approveuser.name):SizedBox(),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Achievements',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                          widget.reports.achievements),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Problems',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          widget.reports.problems),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.asset(
                                  "assets/images/download.png",
                                  fit: BoxFit.fill,
                                ),
                                height: 100,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.asset(
                                  "assets/images/download.png",
                                  fit: BoxFit.fill,
                                ),
                                height: 100,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text('file.docx'),
                          Spacer(),
                          Image.asset("assets/images/Icon feather-eye.png"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'view',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Task Report',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      custom_row(title: 'Task Name', val: 'New Task'),
                      custom_row(title: 'Note', val: 'Task Have some issues'),
                      SizedBox(
                        height: 16,
                      ),
                      // Divider(
                      //   height: 1,
                      //   color: Colors.grey,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       flex: 1,
                      //       child: Container(
                      //         height: 62.0,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(8.0),
                      //           color: const Color(0xFF039712),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'Accept',
                      //             style: TextStyle(
                      //               fontSize: 17.0,
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 8,
                      //     ),
                      //     Expanded(
                      //       flex: 1,
                      //       child: Container(
                      //         height: 62.0,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(8.0),
                      //           color: const Color(0xFFAC2929),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'Reject',
                      //             style: TextStyle(
                      //               fontSize: 17.0,
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 8,
                      //     ),
                      //     Expanded(
                      //       flex: 1,
                      //       child: Container(
                      //         height: 62.0,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(8.0),
                      //           color: const Color(0xFF303D31),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'Note',
                      //             style: TextStyle(
                      //               fontSize: 17.0,
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
