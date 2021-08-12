import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';

import '../../../constants.dart';

class ReportEmployee extends StatefulWidget {
  @override
  _ReportEmployeeState createState() => _ReportEmployeeState();
}

class _ReportEmployeeState extends State<ReportEmployee> {
  TextEditingController sendNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppsCubit()..getallReports(),
        child: BlocConsumer<AppsCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.grey[100],
                body: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime(2020),
                              currentDate: DateTime.now(),
                              lastDate: DateTime(2050),
                              firstDate: DateTime(2015),
                            );
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            padding: EdgeInsets.only(
                                bottom: 10, right: 10, left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("s "),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 50,
                            top: 12,
                            child: Container(
                              padding:
                                  EdgeInsets.only(bottom: 2, left: 2, right: 2),
                              color: Colors.white,
                              child: Text(
                                'Select  Date Range',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            )),
                        // Group: Group 1786
                      ],
                    ),
                    ConditionalBuilder(
                      condition: state is! AppLoadingAllReports,
                      builder: (context) => Expanded(
                        child: ListView.builder(
                            itemCount: AppsCubit.get(context)
                                .allReports
                                .reports
                                .length,
                            itemBuilder: (context, pos) {
                              return item(
                                  AppsCubit.get(context)
                                      .allReports
                                      .reports[pos], () {
                                AppsCubit.get(context).acceptReport(pos, pos);
                              }, () {
                                AppsCubit.get(context).cancelReport(pos, pos);
                              }, context);
                            }),
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              );
            }));
  }

  Widget item(Reports model, Function acceptFunction, Function rejectFunction,
      context) {
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
                      "${model.user.name}",
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
                      "${model.user.contractDate}",
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
                      "Accepted",
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
                      "Report Approved By",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Khaled Ali",
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
                    onTap: () {},
                    child: Text(
                      'More details',
                      style: TextStyle(color: Colors.indigo, fontSize: 16),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  GestureDetector(
                    onTap: acceptFunction,
                    child: Text(
                      "Accept",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.green),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: rejectFunction,
                    child: Text(
                      "Reject",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Send Notes',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          content: TextFormField(
                            controller: sendNote,
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              hintText: "Send Note To Employee",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: const TextStyle(
                                  color: Color(0xffC8C8C8), fontSize: 11),
                            ),
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 18),
                              child: defaultButton(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  background: kPrimaryColor,
                                  text: "Send",
                                  function: () {
                                    AppsCubit.get(context).sendNote(
                                        sendNote.text, model.user.name);
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Note",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
