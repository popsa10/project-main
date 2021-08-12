import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';

class CreateVacationScreen extends StatefulWidget {
  @override
  State<CreateVacationScreen> createState() => _CreateVacationScreenState();
}

class _CreateVacationScreenState extends State<CreateVacationScreen> {
  final vacationName = TextEditingController();

  final startDate = TextEditingController();

  final endDate = TextEditingController();

  final reason = TextEditingController();

  Users issuedTo;

  AppCubit appCubit = AppCubit();
  List<Users> employeesList = [];
  Future<void> getEmp() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployees();
    allEmployeesModel.users.forEach((element) {
      employeesList.add(element);
    });
    setState(() {});
  }

  List<String> types = ["Medical", "Other"];
  String type;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Vocations",
        search: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vacation Request",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              customDropdownMenu(
                  onChanged: (value) {
                    setState(() {
                      type = value;
                      print(type);
                    });
                  },
                  itemList:
                      types.map<DropdownMenuItem<String>>((String value2) {
                    return DropdownMenuItem<String>(
                      value: value2,
                      child: Container(width: 90, child: Text(value2)),
                    );
                  }).toList(),
                  hintText: "Vacation Type",
                  value: type ?? null,
                  label: "Vacation Type"),
              customTextField(
                  controller: vacationName,
                  label: "Vacation Name",
                  keyboardType: TextInputType.name,
                  hintText: "Ex: National Days"),
              customTextField(
                  controller: startDate,
                  label: "Start Date",
                  keyboardType: TextInputType.datetime,
                  hintText: "Select Date",
                  suffix: Icons.calendar_today,
                  suffixFunction: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((value) {
                      print(value);
                      if (value.day == DateTime.now().day) {
                        showToast(
                            text:
                                "The vacation Request must before 24 hours from vacation day ");
                      } else {
                        startDate.text = DateFormat("yyyy-MM-dd").format(value);
                      }
                    });
                  }),
              customTextField(
                  controller: endDate,
                  label: "End Date",
                  keyboardType: TextInputType.datetime,
                  hintText: "Select Date",
                  suffix: Icons.calendar_today,
                  suffixFunction: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050))
                        .then((value) {
                      endDate.text = DateFormat("yyyy-MM-dd").format(value);
                    });
                  }),
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
                                  width: 90,
                                  child: Text(value2.name.toString())),
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
                  controller: reason,
                  label: "Reason",
                  keyboardType: TextInputType.text,
                  hintText: "Reason"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: defaultButton(
                    text: "Submit Request",
                    onPressed: () {
                      AppCubit.get(context)
                          .createVacation(
                              type: type,
                              reason: reason.text,
                              name: vacationName.text,
                              endDate: endDate.text,
                              startDate: startDate.text,
                              employee: issuedTo.id)
                          .then((value) {
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                          "assets/images/checked (-1.png"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Vehicles Added Successfully",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Back",
                                          style: TextStyle(color: kRedColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      });
                    },
                    color: kPrimaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
