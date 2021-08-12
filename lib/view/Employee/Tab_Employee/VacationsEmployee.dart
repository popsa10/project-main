import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/AllVocationModel.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';

class VacationsScrren extends StatelessWidget {
  final TextEditingController taskName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppsCubit()..getAllVacation(),
        child: BlocConsumer<AppsCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      color: Colors.white,
                      child: newTaskField(
                        controller: taskName,
                        label: "Select Data Range",
                        hintText: "Select Data Range",
                        keyboardType: TextInputType.text,
                        icon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is! AppLoadingAllVacationModel,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => vactionList(
                                  AppsCubit.get(context)
                                      .allVacationModel
                                      .vacations[index],
                                  context, () {
                                AppsCubit.get(context)
                                    .acceptVacation(index, index);
                              }, () {
                                AppsCubit.get(context)
                                    .cancelVacation(index, index);
                              }),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: AppsCubit.get(context)
                              .allVacationModel
                              .vacations
                              .length),
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            }));
  }

  Widget vactionList(Vacations model, context, Function acceptFunction,
          Function cancelFunction) =>
      Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${model.startDate}  -------  ${model.endDate}"),
                  Spacer(),
                  Container(
                    width: 60,
                    height: 30,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "${model.type}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "${model.name} ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "Vaction",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "By ${model.employee.name}",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: acceptFunction,
                    child: Text(
                      "Approve",
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: cancelFunction,
                    child: Text(
                      "Reject",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
