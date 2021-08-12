import 'package:flutter/material.dart';
import 'package:project/model/AllEmployeeModel.dart';
import 'package:project/shared/ComponentButton.dart';

class SalaryDetails extends StatelessWidget {
  final Users salaryDetailsModel;

  const SalaryDetails({Key key, this.salaryDetailsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Mohamed Ahmed  \n Salary ", search: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 6,
              ),
              customrow(
                  title: 'Your payroll till',
                  val: '${salaryDetailsModel.joiningDate}'),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    customrow(
                        title: 'Employee ID', val: '${salaryDetailsModel.id}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'Employee Name',
                        val: '${salaryDetailsModel.name}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'month',
                        val: '${salaryDetailsModel.joiningDate}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'Working Days',
                        val: '${salaryDetailsModel.workDayes}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'Working Hours',
                        val: '${salaryDetailsModel.workEnd}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'National vaction',
                        val: '${salaryDetailsModel.company.id}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'Abstracts Day',
                        val: '${salaryDetailsModel.id}'),
                    SizedBox(
                      height: 4,
                    ),
                    text(),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(
                        title: 'Salary', val: '${salaryDetailsModel.salary}'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Accomidition Allowance', val: '200 SAR'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Transporation Allowance', val: '200 SAR'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Phone allowance', val: '200 SAR'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Other Allowance', val: '200 SAR'),
                    text(),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Dealy Penality', val: ' 0 SAR'),
                    SizedBox(
                      height: 4,
                    ),
                    text(),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Bounce', val: '200 SAR'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Reason', val: 'Good Gob'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Submitted By ', val: 'Khaled Ali'),
                    SizedBox(
                      height: 4,
                    ),
                    text(),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Deduction', val: '200 SAR'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Reason', val: 'Bad Attribute'),
                    SizedBox(
                      height: 4,
                    ),
                    customrow(title: 'Submitted By ', val: 'Khaled Ali'),
                    SizedBox(
                      height: 4,
                    ),
                    text(),
                    customrow(title: 'Total : ', val: '3000 SAR'),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Image(
                                    image:
                                        AssetImage("assets/images/event.png")),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          defaultButton(
                              width: MediaQuery.of(context).size.width - 120,
                              text: "Export")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget text() => Text(
        "  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
        style: TextStyle(color: Colors.grey),
      );
}
