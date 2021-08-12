import 'package:flutter/material.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/view/Employee/Eng%20Nasser/AddReport.dart';
import 'package:project/view/reports/report_details.dart';

class Reports extends StatefulWidget {
  const Reports({Key key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  AppCubit appCubit = AppCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: myCustomAppBar(
          title: 'Reports',
          context: context,
          search: true,
          haveNotf: true,
          haveBell: true,
          canPop: true,
          toolbarHeight: 130),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(top: 8, bottom: 8, right: 30, left: 30),
              child: defaultButton(
                  text: 'Add Report', onPressed: () {
                navigateTo(context, CreateReport());
              }, color: Color(0xFF293E4D)),
            ),
            // Stack(
            //   children: <Widget>[
            //     // InkWell(
            //     //   onTap: () {
            //     //     showDatePicker(
            //     //       context: context,
            //     //       initialDate: DateTime(2020),
            //     //       currentDate: DateTime.now(),
            //     //       lastDate: DateTime(2050),
            //     //       firstDate: DateTime(2015),
            //     //     );
            //     //   },
            //     //   child: Container(
            //     //     height: 50,
            //     //     margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            //     //     padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            //     //     decoration: BoxDecoration(
            //     //       color: Colors.white,
            //     //       border: Border.all(color: Colors.grey, width: 2),
            //     //       borderRadius: BorderRadius.circular(10),
            //     //       shape: BoxShape.rectangle,
            //     //     ),
            //     //     child: Row(
            //     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //       children: [
            //     //         Text("s "),
            //     //         Icon(
            //     //           Icons.keyboard_arrow_down_rounded,
            //     //           color: Colors.grey,
            //     //         )
            //     //       ],
            //     //     ),
            //     //   ),
            //     // ),
            //     // Positioned(
            //     //     left: 50,
            //     //     top: 12,
            //     //     child: Container(
            //     //       padding: EdgeInsets.only(bottom: 2, left: 2, right: 2),
            //     //       color: Colors.white,
            //     //       child: Text(
            //     //         'Select  Date Range',
            //     //         style: TextStyle(color: Colors.black, fontSize: 15),
            //     //       ),
            //     //     )),
            //     // Group: Group 1786
            //   ],
            // ),
            // Expanded(
            //   child:
              FutureBuilder<AllReports>(
                  future: appCubit.getAllReports(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.reports.length,
                          itemBuilder: (context, pos) {
                            return item(snapshot.data, pos);
                          });
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }
              ),
            // )
          ],
        ),
      ),
    );
  }

  Widget item(AllReports allReports,pos) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Employee Name",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      allReports.reports[pos].user==null?"":allReports.reports[pos].user.name,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
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
                      "Report Date",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      allReports.reports[pos].createdAt.substring(0,10),
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
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
                      "Status",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      allReports.reports[pos].status.toString()=="1"?"Pending":allReports.reports[pos].status.toString()=="2"?"Accepted":"Rejected",
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: allReports.reports[pos].status.toString()=="2"?Text(
                      "Report Approved By",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ):SizedBox(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      allReports.reports[pos].approveuser==null?"":allReports.reports[pos].approveuser.name,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Divider(
                height: 2,
                color: Colors.grey,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(context, Report_Details(allReports.reports[pos]));
                    },
                    child: Text(
                      'More details',
                      style: TextStyle(color: Colors.indigo, fontSize: 16),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  allReports.reports[pos].status.toString()=="1"?InkWell(
                    onTap: () async {
                      bool response = await appCubit.AcceptReport(allReports.reports[pos].id, allReports.reports[pos].user.id);
                      if(response){
                        showToast(text: "Report accepted successfully");
                        setState(() {

                        });
                      }else{
                        showToast(text: "error");
                      }
                    },
                    child: Text(
                      "Accept",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.green),
                    ),
                  ):SizedBox(),
                  Spacer(
                    flex: 1,
                  ),
                  allReports.reports[pos].status.toString()=="1"?InkWell(
                    onTap: () async {
                      bool response = await appCubit.DeleteReport(allReports.reports[pos].id, allReports.reports[pos].user.id);
                      if(response){
                        showToast(text: "Report rejected successfully");
                        setState(() {

                        });
                      }else{
                        showToast(text: "error");
                      }
                    },
                    child: Text(
                      "Reject",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red),
                    ),
                  ):SizedBox(),
                  Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () async {
                      await showDialog(context: context, builder: (context){
                        var noteController = TextEditingController();
                        return AlertDialog(
                          title: Text("Send note"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                TextField(
                                  controller: noteController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 0.5
                                      )
                                    )
                                  ),
                                ),
                                SizedBox(height: 10,),
                                defaultButton(text: "Send", onPressed: () async {
                                  bool response = await appCubit.SendNote(noteController.text, allReports.reports[pos].user.id);
                                  if(response){
                                    showToast(text: "Note sent successfully");
                                    Navigator.pop(context);
                                  }else{
                                    showToast(text: "error");
                                  }
                                })
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    child: Text(
                      "Note",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
