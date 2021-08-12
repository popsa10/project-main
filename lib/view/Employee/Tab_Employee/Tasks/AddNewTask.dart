import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key key}) : super(key: key);

  @override
  _AddNewTaskScreenState createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController assignedEmployees = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController description = TextEditingController();
  AppCubit appCubit = AppCubit();
  Users issuedTo;
  List<Users> employeesList = [];
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
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                  appBar: CustomAppBar(title: " Add New Task", search: false),
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          customTextField(
                            controller: taskName,
                            label: "Task Name",
                            hintText: "Task Name",
                            keyboardType: TextInputType.text,
                          ),
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
                                              width: 90, child: Text(value2.name.toString())),
                                        );
                                      }).toList(),
                                      hintText: "Choose from Employees",
                                      value: issuedTo ?? null,
                                      label: "Issued To(single)");
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              }),
                          customTextField(
                            controller: startDate,
                            label: "Start Date",
                            hintText: "Start Date",
                            keyboardType: TextInputType.datetime,
                          ),
                          customTextField(
                            controller: endDate,
                            label: "End Date",
                            hintText: "End Date",
                            keyboardType: TextInputType.datetime,
                          ),
                          customTextField(
                              controller: description,
                              label: "Description",
                              hintText: "Description",
                              keyboardType: TextInputType.text,
                              maxLines: 5),
                          SizedBox(
                            height: 3.0,
                          ),
                          defaultButton(
                              text: "Create New Task",
                              onPressed: () {
                                appCubit.createNewTask(
                                    name: taskName.text,
                                    users: assignedEmployees.text,
                                    startDate: startDate.text,
                                    endDate: endDate.text,
                                    description: description.text);
                              },
                              background: kPrimaryColor)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}