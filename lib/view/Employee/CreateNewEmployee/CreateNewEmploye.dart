import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:project/getSharedPrefrences.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';

import '../addEmployee.dart';

class CreateNewEmlpoye extends StatefulWidget {
  @override
  _CreateNewEmlpoyeState createState() => _CreateNewEmlpoyeState();
}

class _CreateNewEmlpoyeState extends State<CreateNewEmlpoye> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postionController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController joiningController = TextEditingController();
  TextEditingController contractController = TextEditingController();
  TextEditingController insuranceStartController = TextEditingController();
  TextEditingController insuranceEndController = TextEditingController();
  TextEditingController attachmentController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController workingStartController = TextEditingController();
  TextEditingController workingEndController = TextEditingController();
  List workingDayController = [];
  TextEditingController accountinationController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController detuctionController = TextEditingController();
  TextEditingController vactionController = TextEditingController();
  TextEditingController overtimeController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  TextEditingController iqamaenddateController = TextEditingController();
  TextEditingController passportenddateController = TextEditingController();
  int group1Value;
  String partTime = "partTime";
  AppsCubit appCubit = AppsCubit();
  List<Users> subEmployeesList = [];
  List<Users> bounceEmployeesList = [];
  List<Users> vacationEmployeesList = [];
  List<Users> overtimeEmployeesList = [];
  List<Users> reportEmployeesList = [];

  Users subEmployeesValue;
  Users bounceEmployeesValue;

  Users vacationEmployeesValue;

  Users overtimeEmployeesValue;

  Users reportEmployeesValue;

  var passPortNum = TextEditingController();
  var employeetype = TextEditingController();

  bool progress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmp();
    getEmpBounce();
    getEmpVacation();
  }

  Future<void> getEmp() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployeesProject();
    allEmployeesModel.users.forEach((element) {
      subEmployeesList.add(element);
    });
    setState(() {});
  }

  Future<void> getEmpBounce() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployeesBounce();
    allEmployeesModel.users.forEach((element) {
      bounceEmployeesList.add(element);
    });
    setState(() {});
  }

  Future<void> getEmpVacation() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployeesVacation();
    allEmployeesModel.users.forEach((element) {
      vacationEmployeesList.add(element);
    });
    setState(() {});
  }

  Future<void> getEmpOverTime() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployeesOvertime();
    allEmployeesModel.users.forEach((element) {
      overtimeEmployeesList.add(element);
    });
    setState(() {});
  }

  Future<void> getEmpeReport() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployeesReport();
    allEmployeesModel.users.forEach((element) {
      reportEmployeesList.add(element);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppsCubit(),
      child: BlocConsumer<AppsCubit, AppStates>(
        listener: (context, state) => {
          if (state is AppScuessADDEmployeeStates) print(state.toString()),
          // showToast(
          //     text: states.shopLoginModel.message,
          //     states: ToastStates.Sucess),
        },
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ////  addd photo and Circle Button  //// /
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          height: 120,
                          child: DottedBorder(
                            color: Colors.grey,
                            strokeWidth: 2,
                            borderType: BorderType.Rect,
                            dashPattern: [6, 6],
                            //dash patterns, 10 is dash width, 6 is space width
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  AppsCubit.get(context).getProfileImage();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFCFCF2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Add Photo"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(
                                      image: AssetImage(
                                        "assets/images/Icon feather-upload-cloud.png",
                                      ),
                                      fit: BoxFit.fill,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        //////// Circle  Radio
                        SizedBox(
                          width: 20,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Employee Type",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //////// radio 1
                            Container(
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.red),
                                    groupValue: group1Value,
                                    onChanged: (value) {
                                      setState(() {
                                        group1Value = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    partTime,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            //////// radio 2
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.red),
                                  groupValue: group1Value,
                                  onChanged: (value) {
                                    setState(() {
                                      group1Value = value;
                                    });
                                  },
                                ),
                                Text(
                                  "FreeLancer",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //////////// radio 3
                            Container(
                              height: 25,
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.red),
                                    focusColor: Colors.red,
                                    value: 3,
                                    groupValue: group1Value,
                                    onChanged: (value) {
                                      setState(() {
                                        group1Value = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Regulary",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 10),
                    child: newTaskField(
                      controller: usernameController,
                      label: "User Name(required)",
                      hintText: "User Name",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: passwordController,
                      label: "Password(required)",
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: emailController,
                      label: "Email(required)",
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: postionController,
                      label: "Postion",
                      hintText: "Postion",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: contactController,
                      label: "Contact Details",
                      hintText: "Contact Details",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: idController,
                      label: "Iqama or ID(required)",
                      hintText: "Iqama or ID",
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: passPortNum,
                      label: "Passport number(required)",
                      hintText: "Passport number",
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        AppsCubit.get(context).getiqamaphotoImage();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 120,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Passport Image",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 15, right: 15, top: 10, bottom: 10),
                  //   child:
                  //   newTaskField(
                  //     controller: joiningController,
                  //     label: "Joining Date",
                  //     hintText: "Joining Date",
                  //     keyboardType: TextInputType.datetime,
                  //     icon: Icon(
                  //       Icons.date_range,
                  //       color: Colors.grey[300],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: CustomTextField(
                        controller: joiningController,
                        label: "Joining Date(required)",
                        keyboardType: TextInputType.datetime,
                        hintText: "Joining Date",
                        suffix: Icons.calendar_today,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            joiningController.text =
                                DateFormat("yyyy-MM-dd").format(value);
                          });
                        }),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 15, right: 15, top: 10, bottom: 10),
                  //   child: newTaskField(
                  //     controller: contractController,
                  //     label: "Contract End",
                  //     hintText: "Contract End",
                  //     keyboardType: TextInputType.datetime,
                  //     icon: Icon(
                  //       Icons.date_range,
                  //       color: Colors.grey[300],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: CustomTextField(
                        controller: contractController,
                        label: "Contract End(required)",
                        keyboardType: TextInputType.datetime,
                        hintText: "Contract End",
                        suffix: Icons.calendar_today,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            contractController.text =
                                DateFormat("yyyy-MM-dd").format(value);
                          });
                        }),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 15, right: 15, top: 10, bottom: 10),
                  //   child: newTaskField(
                  //     controller: insuranceStartController,
                  //     label: "Insurance Date Start",
                  //     hintText: "Insurance Date Start",
                  //     keyboardType: TextInputType.datetime,
                  //     icon: Icon(
                  //       Icons.date_range,
                  //       color: Colors.grey[300],
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: CustomTextField(
                        controller: insuranceStartController,
                        label: "Insurance Date Start(required)",
                        keyboardType: TextInputType.datetime,
                        hintText: "Insurance Date Start",
                        suffix: Icons.calendar_today,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            insuranceStartController.text =
                                DateFormat("yyyy-MM-dd").format(value);
                          });
                        }),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 15, right: 15, top: 10, bottom: 10),
                  //   child: newTaskField(
                  //     controller: insuranceEndController,
                  //     label: "Insurance Date End",
                  //     hintText: "Insurance Date End",
                  //     keyboardType: TextInputType.datetime,
                  //     icon: Icon(
                  //       Icons.date_range,
                  //       color: Colors.grey[300],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: CustomTextField(
                        controller: insuranceEndController,
                        label: "Insurance Date Start(required)",
                        keyboardType: TextInputType.datetime,
                        hintText: "Insurance Date Start",
                        suffix: Icons.calendar_today,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            insuranceEndController.text =
                                DateFormat("yyyy-MM-dd").format(value);
                          });
                        }),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        AppsCubit.get(context).getpassportphotoImage();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 120,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Iqama Image",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                    child: CustomTextField(
                        controller: iqamaenddateController,
                        label: "iqamaenddate(required)",
                        keyboardType: TextInputType.datetime,
                        hintText: "iqamaenddate",
                        suffix: Icons.calendar_today,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            iqamaenddateController.text =
                                DateFormat("yyyy-MM-dd").format(value);
                          });
                        }),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                    child: CustomTextField(
                        controller: passportenddateController,
                        label: "passportenddate(required)",
                        keyboardType: TextInputType.datetime,
                        hintText: "passportenddate",
                        suffix: Icons.calendar_today,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            passportenddateController.text =
                                DateFormat("yyyy-MM-dd").format(value);
                          });
                        }),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        AppsCubit.get(context).getinsurancephotoImage();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 80,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Insuarance Photo",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: attachmentController,
                      label: "",
                      hintText: "attatchment link",
                      keyboardType: TextInputType.text,
                      icon: Icon(
                        Icons.attachment,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  ////////////// upload File /////////////
                  InkWell(
                    onTap: () {
                      setState(() {
                        AppsCubit.get(context).uploadFile();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 80,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Other Files",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: salaryController,
                      label: "Basic Salary(required)",
                      hintText: "Basic Salary",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ///////////////////////

                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                            controller: workingStartController,
                            label: "Working Start time(required)",
                            hintText: "Start time",
                            keyboardType: TextInputType.number,
                            icon: InkWell(
                                onTap: () async {
                                  TimeOfDay time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  workingStartController.text =
                                      "${time.hour}:${time.minute}";
                                },
                                child: Icon(Icons.timeline))),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                            controller: workingEndController,
                            label: "Working End time(required)",
                            hintText: "End time",
                            keyboardType: TextInputType.number,
                            icon: InkWell(
                                onTap: () async {
                                  TimeOfDay time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  workingEndController.text =
                                      "${time.hour}:${time.minute}";
                                },
                                child: Icon(Icons.timeline))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
//["saturday","sunday","monday","tuesday","wednesday","thursday"]
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MultiSelectDialogField(
                      height: 90,
                      title: Text("Choose from Days"),
                      searchHint: "Choose from Days",
                      buttonText: Text("Choose from Days"),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      items: <String>[
                        "saturday",
                        "sunday",
                        "monday",
                        "tuesday",
                        "wednesday",
                        "thursday"
                      ].map((e) => MultiSelectItem(e, e)).toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (values) {
                        workingDayController = values;
                      },
                    ),
                  ),
                  /////////////////////////////////////////

                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: accountinationController,
                          label: "Accountion",
                          hintText: "accountion",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: transportationController,
                          label: "Transportion",
                          hintText: "transportion",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

////////////////////////
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: phoneController,
                          label: "Phone(required)",
                          hintText: "Phone",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: otherController,
                          label: "Other",
                          hintText: "Other",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  ///////////////////////

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        //////////////    With OVer Time  //////////////
                        SizedBox(
                          width: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "With over Time",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<AllEmployeesModel>(
                      future: appCubit.getEmployeesProject(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("pppppppp${snapshot.data.users}");
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: customDropdownMenu(
                                onChanged: (value) {
                                  setState(() {
                                    subEmployeesValue = value;
                                  });
                                },
                                itemList: subEmployeesList
                                    .map<DropdownMenuItem<Users>>(
                                        (Users value2) {
                                  return DropdownMenuItem<Users>(
                                    value: value2,
                                    child: Container(
                                        width: 90, child: Text(value2.name)),
                                  );
                                }).toList(),
                                hintText: "Choose from Employees(required)",
                                value: subEmployeesValue ?? null,
                                label: "Sub employees"),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),

                  FutureBuilder<AllEmployeesModel>(
                      future: appCubit.getEmployeesBounce(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("pppppppp${snapshot.data.users}");
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: customDropdownMenu(
                                onChanged: (value) {
                                  setState(() {
                                    bounceEmployeesValue = value;
                                  });
                                },
                                itemList: bounceEmployeesList
                                    .map<DropdownMenuItem<Users>>(
                                        (Users value2) {
                                  return DropdownMenuItem<Users>(
                                    value: value2,
                                    child: Container(
                                        width: 90, child: Text(value2.name)),
                                  );
                                }).toList(),
                                hintText: "Choose from Employees",
                                value: bounceEmployeesValue ?? null,
                                label: "Detection/Bounce"),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),

                  FutureBuilder<AllEmployeesModel>(
                      future: appCubit.getEmployeesVacation(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("pppppppp${snapshot.data.users}");
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: customDropdownMenu(
                                onChanged: (value) {
                                  setState(() {
                                    vacationEmployeesValue = value;
                                  });
                                },
                                itemList: vacationEmployeesList
                                    .map<DropdownMenuItem<Users>>(
                                        (Users value2) {
                                  return DropdownMenuItem<Users>(
                                    value: value2,
                                    child: Container(
                                        width: 90, child: Text(value2.name)),
                                  );
                                }).toList(),
                                hintText: "Choose from Employees(required)",
                                value: vacationEmployeesValue ?? null,
                                label: "Vacation Approval"),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),

                  FutureBuilder<AllEmployeesModel>(
                      future: appCubit.getEmployeesOvertime(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("pppppppp${snapshot.data.users}");
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: customDropdownMenu(
                                onChanged: (value) {
                                  setState(() {
                                    overtimeEmployeesValue = value;
                                  });
                                },
                                itemList: overtimeEmployeesList
                                    .map<DropdownMenuItem<Users>>(
                                        (Users value2) {
                                  return DropdownMenuItem<Users>(
                                    value: value2,
                                    child: Container(
                                        width: 90, child: Text(value2.name)),
                                  );
                                }).toList(),
                                hintText: "Choose from Employees(required)",
                                value: overtimeEmployeesValue ?? null,
                                label: "Overtime Approval"),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),

                  FutureBuilder<AllEmployeesModel>(
                      future: appCubit.getEmployeesReport(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("pppppppp${snapshot.data.users}");
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: customDropdownMenu(
                                onChanged: (value) {
                                  setState(() {
                                    reportEmployeesValue = value;
                                  });
                                },
                                itemList: reportEmployeesList
                                    .map<DropdownMenuItem<Users>>(
                                        (Users value2) {
                                  return DropdownMenuItem<Users>(
                                    value: value2,
                                    child: Container(
                                        width: 90, child: Text(value2.name)),
                                  );
                                }).toList(),
                                hintText: "Choose from Employees(required)",
                                value: reportEmployeesValue ?? null,
                                label: "Overtime Approval"),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: !progress
                            ? defaultButtonnew(
                                text: "Save Empolyee",
                                onPressed: () async {
                                  if (passPortNum.text.length > 10) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "passport number must be less than 11 character",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        fontSize: 16.0);
                                    return;
                                  }
                                  setState(() {
                                    progress = true;
                                  });

                                  await AppsCubit.get(context).addNewEmployee(
                                    {
                                      "photo":
                                          AppsCubit.get(context).photoimage,
                                      // !=null?await MultipartFile.fromFile(
                                      //       AppCubit.get(context).photoimage.path,
                                      //       filename: AppCubit.get(context)
                                      //           .photoimage
                                      //           .path
                                      //           .split('/')
                                      //           .last):"",
                                      "name": usernameController.text,
                                      "passportnum": passPortNum.text,
                                      "employeetype": group1Value == 0
                                          ? "FullTime"
                                          : group1Value == 1
                                              ? "ParTime"
                                              : "Regular",
                                      "iqama": idController.text,
                                      "iqamaphoto":
                                          AppsCubit.get(context).iqamaphoto,
                                      // !=null?await MultipartFile.fromFile(
                                      //       // AppCubit.get(context).iqamaphoto.path,
                                      //       AppCubit.get(context).iqamaphoto.path,
                                      //       filename: AppCubit.get(context)
                                      //           .iqamaphoto
                                      //           .path
                                      //           .split('/')
                                      //           .last):"",
                                      "passport_photo":
                                          AppsCubit.get(context).passportphoto,
                                      // !=null?await MultipartFile.fromFile(
                                      //       // AppCubit.get(context).iqamaphoto.path,
                                      //       AppCubit.get(context).passportphoto.path,
                                      //       filename: AppCubit.get(context)
                                      //           .passportphoto
                                      //           .path
                                      //           .split('/')
                                      //           .last):"",

                                      "insurance_photo":
                                          AppsCubit.get(context).insurancephoto,
                                      // !=null?await MultipartFile.fromFile(
                                      //       // AppCubit.get(context).insurancephoto.path,
                                      //       AppCubit.get(context).insurancephoto.path,
                                      //       filename:
                                      //           // AppCubit.get(context)
                                      //           //     .insurancephoto
                                      //           AppCubit.get(context)
                                      //               .insurancephoto
                                      //               .path
                                      //               .split('/')
                                      //               .last):"",
                                      "contract_file":
                                          AppsCubit.get(context).fileupload,
                                      // !=null? await MultipartFile.fromFile(
                                      //       AppCubit.get(context).fileupload.path,
                                      //       filename: AppCubit.get(context)
                                      //           .fileupload
                                      //           .path
                                      //           .split('/')
                                      //           .last):"",
                                      "others": otherController.text,
                                      "email": emailController.text,
                                      "password": passwordController.text,
                                      "phone": phoneController.text,
                                      // "permission": permissionController.text,
                                      "salary": salaryController.text,
                                      "work_dayes":
                                          workingDayController.join(","),
                                      "work_start": workingStartController.text,
                                      "work_end": workingEndController.text,
                                      "iqamaenddate":
                                          iqamaenddateController.text,
                                      "passportenddate":
                                          passportenddateController.text,
                                      "joining_date": joiningController.text,
                                      "contract_date": contractController.text,
                                      "insurance_start_date":
                                          insuranceEndController.text,
                                      "insurance_end_date":
                                          insuranceStartController.text,
                                      "company_id":
                                          await getSharedPrefrences("comId") ??
                                              "1",
                                      "owner_id": await getSharedPrefrences(
                                              "ownerId") ??
                                          "1",
                                      "subemployee": subEmployeesValue != null
                                          ? subEmployeesValue.id.toString()
                                          : "1",
                                      "vacationemployee":
                                          vacationEmployeesValue != null
                                              ? vacationEmployeesValue.id
                                                  .toString()
                                              : "3",
                                      "overtimeemployee":
                                          overtimeEmployeesValue != null
                                              ? overtimeEmployeesValue.id
                                                  .toString()
                                              : "3",
                                      "reportemployee": reportEmployeesValue !=
                                              null
                                          ? reportEmployeesValue.id.toString()
                                          : "3",
                                      "bounceemployee": bounceEmployeesValue !=
                                              null
                                          ? bounceEmployeesValue.id.toString()
                                          : "3",
                                      //  group1Value == 0
                                      //     ? "FullTime"
                                      //     : group1Value == 1
                                      //         ? "ParTime"
                                      //         : "Regular"
                                    },
                                  );
                                  setState(() {
                                    progress = false;
                                  });
                                },
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    progress = false;
                                  });
                                },
                                child:
                                    Center(child: CircularProgressIndicator())),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            navigateAndFinish(context, AddEmployee());
                          });
                        },
                        child: Text(
                          "Return To All Employee",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),

                  ////////////////////////////
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
