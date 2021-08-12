
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool statusAddEmployee = false;
  bool statusEditEmployee = false;
  bool statusDeleteEmployee = false;
  bool statusViewEmployee = false;
  bool statusAddProject = false;
  bool statusEditProject = false;
  bool statusDeleteProject = false;
  bool statusViewProject = false;
  bool statusAddVehicles = false;
  bool statusEditVehicles = false;
  bool statusDeleteVehicles = false;
  bool statusViewVehicles = false;
  bool statusAddReports = false;
  bool statusEditReports = false;
  bool statusDeleteReports = false;
  bool statusViewReports = false;
  bool statusAddTasks = false;
  bool statusEditTasks = false;
  bool statusDeleteTasks  = false;
  bool statusViewTasks = false;
  bool statusAddLocations = false;
  bool statusEditLocations = false;
  bool statusDeleteLocations  = false;
  bool statusViewLocations = false;
  bool statusPayroll = false;
  List<Users> employeesList = [];
  Users issuedTo;
  List<String> permissions = [];

  AppCubit appCubit = AppCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmp();
  }

  Future<void> getEmp() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployees();
    allEmployeesModel.users.forEach((element) {
      employeesList.add(element);
    });
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<AllEmployeesModel>(
                  future: appCubit.getEmployees(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("pppppppp${snapshot.data.users}");
                      return customDropdownMenu(
                          onChanged: (value) {
                            setState(() {
                              issuedTo = value;
                              print(issuedTo);
                            });
                          },
                          itemList: employeesList
                              .map<DropdownMenuItem<Users>>((Users value2) {
                            return DropdownMenuItem<Users>(
                              value: value2,
                              child: Container(
                                  width: 90, child: Text(value2.name)),
                            );
                          }).toList(),
                          hintText: "Choose from Employees",
                          value: issuedTo ?? null,
                          label: "Issued To(single)");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              Text(
                "Employee",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AddEmployee",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddEmployee,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddEmployee = value;
                        });
                      }),
                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Employee",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditEmployee,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditEmployee = value;
                        });
                      }),
                ],
              ),

              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Employee",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteEmployee,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteEmployee = value;
                        });
                      }),
                ],
              ),

              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Employee",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewEmployee,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewEmployee = value;
                        });
                      }),
                ],
              ),

              SizedBox(
                height: 6,
              ),

              Text(
                "Projects",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AddProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddProject = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EditProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditProject = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DeleteProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteProject = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ViewProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewProject = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),

              //////////////////////////////////// add vehicals   /// / /
              SizedBox(height: 10,),
              Text(
                "Vehicles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Vehicles",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddVehicles,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddVehicles = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Vehicles",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditVehicles,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditVehicles= value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Vehicles",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteVehicles,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteVehicles = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Vehicles",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewVehicles,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewVehicles = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 5,
              ),


              //  circleSelect(group: groupAssignVehicles, text: "Assign Vehicles"),

              //   circleSelect(group: groupAddVehicles, text: "Add Vehicles"),


              SizedBox(
                height: 6,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 8,
              ),
              ///////////////////////////// add Report  /////////////////

              Text(
                "Reports",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Reports",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddReports,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddReports = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Reports",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditReports,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditReports= value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Reports",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteReports,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteReports = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Reports",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewReports,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewReports = value;
                        });
                      }),
                ],
              ),


              SizedBox(
                height: 6,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 8,
              ),

              Text(
                "Locations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Locations",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddLocations,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddLocations = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Locations",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditLocations,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditLocations= value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Locations",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteLocations,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteLocations = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Locations",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewLocations,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewLocations = value;
                        });
                      }),
                ],
              ),


              SizedBox(
                height: 6,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 8,
              ),

              //////////////////////////// add Tasks ////////////////////////
              Text(
                "Tasks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Tasks",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddTasks,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddTasks = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Tasks",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditTasks,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditTasks= value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Tasks",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteTasks,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteTasks = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Tasks",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewTasks,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewTasks = value;
                        });
                      }),
                ],
              ),

              SizedBox(
                height: 8,
              ),

              //////////////////////////// add Tasks ////////////////////////
              Text(
                "Payroll",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payroll",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusPayroll,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusPayroll = value;
                        });
                      }),
                ],
              ),


              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    if(issuedTo!=null) {
                      if (statusAddEmployee) permissions.add("add_employee");
                      if (statusEditEmployee) permissions.add(
                          "edit_employee");
                      if (statusDeleteEmployee) permissions.add(
                          "delete_employee");
                      if (statusViewEmployee) permissions.add(
                          "view_employee");

                      if (statusAddProject) permissions.add("add_Projects");
                      if (statusEditProject) permissions.add("edit_Projects");
                      if (statusDeleteProject) permissions.add(
                          "delete_Projects");
                      if (statusViewProject) permissions.add("view_Projects");

                      if (statusAddLocations) permissions.add(
                          "add_Locations");
                      if (statusEditLocations) permissions.add(
                          "edit_Locations");
                      if (statusDeleteLocations) permissions.add(
                          "delete_Locations");
                      if (statusViewLocations) permissions.add(
                          "view_Locations");

                      if (statusAddVehicles) permissions.add("add_Vehicles");
                      if (statusEditVehicles) permissions.add(
                          "edit_Vehicles");
                      if (statusDeleteVehicles) permissions.add(
                          "delete_Vehicles");
                      if (statusViewVehicles) permissions.add(
                          "view_Vehicles");

                      if (statusAddReports) permissions.add("add_reports");
                      if (statusEditVehicles) permissions.add("edit_reports");
                      if (statusDeleteVehicles) permissions.add(
                          "delete_reports");
                      if (statusViewVehicles) permissions.add("view_reports");

                      if (statusAddTasks) permissions.add("add_task");
                      if (statusEditTasks) permissions.add("edit_task");
                      if (statusDeleteTasks) permissions.add("delete_task");
                      if (statusViewTasks) permissions.add("view_task");


                      if (statusPayroll) permissions.add("approval_payroll");

                      appCubit.addPermissions(
                          userid: issuedTo, permission: permissions);
                    }else{
                      Fluttertoast.showToast(
                          msg: "Please Select From Employees",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0);
                    }
                  },
                  child: Center(
                    child: DefaultButton(
                      text: "Save Employee",
                      width: MediaQuery.of(context).size.width - 100,
                      onPressed: () {

                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget circleSelect({int group, String text}) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //////// radio 1
              Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                    Text(
                      "all",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              //////// radio 2
              Container(
                height: 20,
                child: Row(
                  children: [
                    Radio(
                      value: 2,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                    Text(
                      "Sub Employee",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //////////// radio 3
              Container(
                height: 20,
                child: Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      focusColor: Colors.red,
                      value: 3,
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                    Text(
                      "None",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
