import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project/model/all_bounce.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';
import 'package:project/view/payroll/payroll%20_sheet_1.dart';
import 'package:project/view/payroll/reduction_screen.dart';

import '../../constants.dart';
import 'bounce.dart';

class Detuction_list extends StatefulWidget {
  const Detuction_list({Key key}) : super(key: key);

  @override
  _Detuction_listState createState() => _Detuction_listState();
}

List<Users> employeesList = [];
bool isSearch = false;
Users issuedTo;
AppCubit appCubit = AppCubit();
TextEditingController date = TextEditingController();

class _Detuction_listState extends State<Detuction_list> {
  Future<void> getEmp() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployees();
    allEmployeesModel.users.forEach((element) {
      employeesList.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmp();
    appCubit.getAllBounce();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Payroll'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Container(
          color: Colors.grey[100],
          width: _size.width,
          height: _size.height,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                child: Container(
                  // height: _size.height * .60,
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: _size.height * 0.342,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Column(
                          children: [
                            FutureBuilder<AllEmployeesModel>(
                                future: appCubit.getEmployees(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    print("pppppppp${snapshot.data.users}");
                                    return DropdownButton(
                                      onChanged: (value) {
                                        setState(() {
                                          issuedTo = value;
                                          print(issuedTo);
                                        });
                                      },
                                      items: employeesList
                                          .map<DropdownMenuItem<Users>>(
                                              (Users value2) {
                                        return DropdownMenuItem<Users>(
                                          value: value2,
                                          child: Container(
                                              width: 90,
                                              child: Text(
                                                value2.name,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        "Choose from Employees",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: issuedTo ?? null,
                                    );
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            customTextField(
                                label: "Date",
                                hintText: "date",
                                controller: date,
                                suffix: Icons.calendar_today,
                                suffixFunction: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2050))
                                      .then((value) {
                                    date.text =
                                        DateFormat("yyyy-MM-dd").format(value);
                                  });
                                },
                                keyboardType: TextInputType.datetime),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: defaultButtonnew(
                                  text: "Search",
                                  onPressed: () {
                                    setState(() {
                                      isSearch = true;
                                    });
                                  }),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  navigateTo(context, Bounce_Screen());
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    'Add Bounce',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  )),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xFF293E4D),
                                        const Color(0xFF10181E)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                navigateTo(context, DeductionScreen());
                              },
                              child:
// Group: Group 69934
                                  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xFFB0302B),
                                        const Color(0xFFAF1E20)
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Add Deduction ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text('Deduction/Bounce  List '),
                      FutureBuilder<AllBounce>(
                          future: isSearch == false
                              ? appCubit.getAllBounce()
                              : appCubit.searchPayroll(issuedTo.id, date.text),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              print("helllo  hello" + snapshot.data.msg);
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.payrolls.length,
                                  itemBuilder: (context, pos) {
                                    return itemList(
                                        context: context,
                                        model: snapshot.data.payrolls[pos]);
                                  });
                            } else
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget itemList({@required BuildContext context, Payroll model, int index}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
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
                    "Emloyee ID",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "1",
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
                    model.name,
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
                    "Month",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "April",
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
                    "Payroll",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${model.salary} SAR",
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
                    "Status",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    model.status.toString(),
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    navigateTo(
                        context,
                        Payroll_Sheet_1(
                          model: model,
                        ));
                  },
                  child: Text(
                    'More details',
                    style: TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                ),
                if (model.status == "unpaid")
                  TextButton(
                    onPressed: () async {
                      await AppCubit.get(context)
                          .paidBounce(bounceId: model.id);
                      setState(() {});
                    },
                    child: Text(
                      'Paid',
                      style: TextStyle(
                          color: kGreenColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget searchItemList(
  //     {@required BuildContext context, Payroll model, int index}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0),
  //     child: Container(
  //       padding: const EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10), color: Colors.white),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "Emloyee ID",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "1",
  //                   style:
  //                       TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "Employee Name",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "mohammed",
  //                   style:
  //                       TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "Month",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "April",
  //                   style:
  //                       TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "Payroll",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "${model.salary} SAR",
  //                   style:
  //                       TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   "Status",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Expanded(
  //                 flex: 1,
  //                 child: Text(
  //                   model.status,
  //                   style:
  //                       TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Divider(
  //             height: 2,
  //             color: Colors.grey,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               if (model.status == "unpaid")
  //                 TextButton(
  //                   onPressed: () async {
  //                     await AppCubit.get(context)
  //                         .paidBounce(bounceId: model.id);
  //                     setState(() {});
  //                   },
  //                   child: Text(
  //                     'Paid',
  //                     style: TextStyle(
  //                         color: kGreenColor,
  //                         fontSize: 16,
  //                         decoration: TextDecoration.underline),
  //                   ),
  //                 ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
