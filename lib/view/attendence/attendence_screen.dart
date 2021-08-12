import 'package:flutter/material.dart';
import 'package:project/model/AllAttendanceModel.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constants.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({Key key}) : super(key: key);

  @override
  _AttendenceScreenState createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  AppCubit appCubit = AppCubit();
  final calenderController = CalendarController();
  String dateTime =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: FutureBuilder<AllAtendanceModel>(
          future: appCubit.getAllAttendance(dateTime),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: _size.width,
                height: _size.height,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        height: _size.height * .75,
                        color: Colors.grey[100],
                        child: Column(
                          children: [
                            Container(
                              width: _size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TableCalendar(
                                calendarStyle:
                                    CalendarStyle(highlightToday: true),
                                initialCalendarFormat: CalendarFormat.week,
                                startDay: DateTime.utc(2010, 10, 16),
                                endDay: DateTime.utc(2030, 3, 14),
                                onDaySelected: (value, lis, list) {
                                  setState(() {
                                    dateTime =
                                        "${value.year}-${value.month}-${value.day}";
                                  });
                                },
                                calendarController: calenderController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  itemInRow(
                                      borderColor:
                                          Color(0xFF8AC111).withOpacity(0.54),
                                      colorofBox:
                                          Color(0xFFDFFE9A).withOpacity(0.54),
                                      text: "${snapshot.data.attend}\n Attend"),
                                  itemInRow(
                                      borderColor:
                                          Color(0xFFFF0000).withOpacity(0.54),
                                      colorofBox:
                                          Color(0xFFFF7E97).withOpacity(0.54),
                                      text: "${snapshot.data.absent}\n Absent"),
                                  itemInRow(
                                      borderColor:
                                          Color(0xFFB1E842).withOpacity(0.54),
                                      colorofBox:
                                          Color(0xFFF6FFDC).withOpacity(0.54),
                                      text:
                                          "${snapshot.data.countvation}\n Vacation"),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: ListView.builder(
                                    itemCount: snapshot.data.attends.length,
                                    itemBuilder: (context, pos) {
                                      return itemList(snapshot.data, pos);
                                    })),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: _size.height * .28,
                    //   decoration: const BoxDecoration(
                    //     color: kPrimaryColor,
                    //     borderRadius: BorderRadiusDirectional.only(
                    //         bottomStart: Radius.circular(20),
                    //         bottomEnd: Radius.circular(20)),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Stack(
                    //         children: <Widget>[
                    //           InkWell(
                    //             onTap: () {
                    //               showDatePicker(
                    //                 context: context,
                    //                 initialDate: DateTime(2020),
                    //                 currentDate: DateTime.now(),
                    //                 lastDate: DateTime(2050),
                    //                 firstDate: DateTime(2015),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 50,
                    //               width: _size.width * .9,
                    //               margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    //               padding:
                    //               EdgeInsets.only(
                    //                   bottom: 10, right: 10, left: 10),
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.white, width: 2),
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 shape: BoxShape.rectangle,
                    //               ),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment
                    //                     .spaceBetween,
                    //                 children: [
                    //                   Text("sdaljghoisadhgo;idsago"),
                    //                   Icon(
                    //                     Icons.calendar_today_outlined,
                    //                     color: Colors.white,
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //           Positioned(
                    //               left: 50,
                    //               top: 12,
                    //               child: Container(
                    //                 padding:
                    //                 EdgeInsets.only(bottom: 2, left: 2, right: 2),
                    //                 color: Colors.black,
                    //                 child: Text(
                    //                   'Date Range',
                    //                   style:
                    //                   TextStyle(
                    //                       color: Colors.white, fontSize: 15),
                    //                 ),
                    //               )),
                    //         ],
                    //       ),
                    //       Stack(
                    //         children: <Widget>[
                    //           InkWell(
                    //             onTap: () {
                    //               showDatePicker(
                    //                 context: context,
                    //                 initialDate: DateTime(2020),
                    //                 currentDate: DateTime.now(),
                    //                 lastDate: DateTime(2050),
                    //                 firstDate: DateTime(2015),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 50,
                    //               width: _size.width * .9,
                    //               margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    //               padding:
                    //               EdgeInsets.only(
                    //                   bottom: 10, right: 10, left: 10),
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.white, width: 2),
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 shape: BoxShape.rectangle,
                    //               ),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment
                    //                     .spaceBetween,
                    //                 children: [
                    //                   Text("sdaljghoisadhgo;idsago"),
                    //                   Icon(
                    //                     Icons.keyboard_arrow_down_rounded,
                    //                     color: Colors.white,
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //           Positioned(
                    //               left: 50,
                    //               top: 12,
                    //               child: Container(
                    //                 padding:
                    //                 EdgeInsets.only(bottom: 2, left: 2, right: 2),
                    //                 color: Colors.black,
                    //                 child: Text(
                    //                   'Location',
                    //                   style:
                    //                   TextStyle(
                    //                       color: Colors.white, fontSize: 15),
                    //                 ),
                    //               )),
                    //           // Group: Group 1786
                    //         ],
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 16.0),
                    //         child: Container(
                    //           width: _size.width * .9,
                    //           height: 50.0,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(8.0),
                    //             gradient: LinearGradient(
                    //               begin: Alignment.topCenter,
                    //               end: Alignment.bottomCenter,
                    //               colors: [
                    //                 const Color(0xFFF2503E),
                    //                 const Color(0xFFCE3827)
                    //               ],
                    //             ),
                    //           ),
                    //           child: Center(
                    //             child: Text(
                    //               'Search',
                    //               style: TextStyle(
                    //                 fontSize: 17.0,
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w600,
                    //               ),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget itemList(AllAtendanceModel attendance, pos) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Emloyee ID",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attendance.attends[pos].user.id.toString(),
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Employee Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attendance.attends[pos].user.name,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "location",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attendance.attends[pos].location == null
                        ? ""
                        : attendance.attends[pos].location.title,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Working Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attendance.attends[pos].user.workStart.substring(0, 5),
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Overtime",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attendance.attends[pos].overtime,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attendance.attends[pos].counttime,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemInRow({
    @required String text,
    @required Color colorofBox,
    @required Color borderColor,
  }) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colorofBox,
        border: Border.all(
          width: 1.0,
          color: borderColor,
        ),
      ),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
      )),
    );
  }
}
