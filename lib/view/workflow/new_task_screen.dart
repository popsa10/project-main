import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:project/constants.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';

class NewTaskScreen extends StatefulWidget {
  final String id,type;
  NewTaskScreen({Key key, this.id,this.type}) : super(key: key);
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController assignedEmployees = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController description = TextEditingController();
  AppCubit appCubit = AppCubit();
  List<Users> issuedTo;
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
                  appBar: CustomAppBar(title: widget.type=="edit"?"Edit Task":" Add New Task", search: false),
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
                          MultiSelectDialogField(
                            height: 60,
                            title: Text("Choose from Employees"),
                            searchHint: "Choose from Employees",
                            buttonText: Text("Choose from Employees"),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(width: 0.5, color: Colors.grey)),
                            items: employeesList
                                .map((e) => MultiSelectItem(e, e.name))
                                .toList(),
                            listType: MultiSelectListType.CHIP,
                            onConfirm: (values) {
                              issuedTo = values;
                            },
                          ),
                          customTextField(
                            controller: startDate,
                            label: "Start Date",
                            hintText: "Start Date",
                            keyboardType: TextInputType.datetime,
                            suffix: Icons.calendar_today,
                            suffixFunction: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                                  .then((value) {
                                startDate.text =
                                    DateFormat("yyyy-MM-dd").format(value);
                              });
                            },
                          ),
                          customTextField(
                            controller: endDate,
                            label: "End Date",
                            hintText: "End Date",
                            keyboardType: TextInputType.datetime,
                            suffix: Icons.calendar_today,
                            suffixFunction: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                                  .then((value) {
                                endDate.text =
                                    DateFormat("yyyy-MM-dd").format(value);
                              });
                            },
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
                                List<String> empIds = [];
                                issuedTo.forEach((element) {
                                  empIds.add(element.id.toString());
                                });
                                print(taskName.text);
                                print(startDate.text);
                                print(endDate.text);
                                if(widget.type=="add") {
                                  appCubit.createNewTask(
                                      name: taskName.text,
                                      users: empIds.join(","),
                                      startDate: startDate.text,
                                      endDate: endDate.text,
                                      ProjectId: widget.id,
                                      description: description.text);
                                }else{
                                  appCubit.editTask(
                                      name: taskName.text,
                                      users: empIds.join(","),
                                      startDate: startDate.text,
                                      endDate: endDate.text,
                                      task_id: widget.id,
                                      description: description.text);
                                }
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