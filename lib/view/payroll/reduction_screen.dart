import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:project/constants.dart';
import 'package:project/getSharedPrefrences.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';

class DeductionScreen extends StatefulWidget {
  DeductionScreen({Key key}) : super(key: key);

  @override
  State<DeductionScreen> createState() => _DeductionScreenState();
}

AppCubit appCubit = AppCubit();
List<Users> employeesList = [];

class _DeductionScreenState extends State<DeductionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appCubit.getEmployees();
    getEmp();
  }

  Future<void> getEmp() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployees();
    allEmployeesModel.users.forEach((element) {
      employeesList.add(element);
    });
    setState(() {});
  }

  List<Users> employee;
  final dateController = TextEditingController();
  final bounceAmount = TextEditingController();
  final reason = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: "Detuction", haveNotf: false, haveBell: false, canPop: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 4),
                  child: Text(
                    'Create New Detuction ',
                    style: TextStyle(),
                  ),
                ),
                MultiSelectDialogField(
                  height: 60,
                  title: Text("Employees (Multiple)"),
                  searchHint: "Choose from Employees",
                  buttonText: Text("Choose from Employees"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  items: employeesList
                      .map((e) => MultiSelectItem(e, e.name.toString()))
                      .toList(),
                  listType: MultiSelectListType.CHIP,
                  onConfirm: (values) {
                    employee = values;
                  },
                ),
                customTextField(
                    controller: dateController,
                    hintText: "date",
                    label: "date",
                    suffixFunction: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime(2020),
                        currentDate: DateTime.now(),
                        lastDate: DateTime(2050),
                        firstDate: DateTime(2015),
                      ).then((value) {
                        dateController.text =
                            DateFormat("yyyy-MM-dd").format(value);
                      });
                    },
                    suffix: Icons.calendar_today),
                customTextField(
                    controller: bounceAmount,
                    label: "Detuction Amount",
                    hintText: "Detuction Amount",
                    suffix: Icons.arrow_downward),
                customTextField(
                  controller: reason,
                  label: "Reason",
                  hintText: "Reason",
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        List<String> emp = [];
                        employee.forEach((element) {
                          emp.add(element.id.toString());
                        });
                        AppCubit.get(context).
                        addDetuction(
                            date: dateController.text,
                            userId: await getSharedPrefrences("id"),
                            amount: bounceAmount.text,
                            reason: reason.text,
                            employess: employee.join(","));
                      },
                      child: Container(
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
                        child: Center(
                          child: Text(
                            'Submit ',
                            style: TextStyle(
                              fontSize: 17.0,
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
          ),
        ));
  }
}
