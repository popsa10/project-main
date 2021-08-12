import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({Key key}) : super(key: key);

  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {

  String imployeesValue;
  final TextEditingController notesController = TextEditingController();
  List<Users> employeesList = [];

  AppCubit appCubit = AppCubit();

  var issuedTo;

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
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "send Notification",
          search: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
              customTextField(
                  controller: notesController,
                  keyboardType: TextInputType.text,
                  label: "Notes",
                  hintText: "Notes",
                  maxLines: 5),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: defaultButton(
                    text: "Send", onPressed: () {
                      appCubit.sendNote(notesController.text, issuedTo.id.toString());
                }, color: kPrimaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
