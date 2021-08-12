import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/AllEmployeeModel.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/view/Employee/CreateNewEmployee/TabNewemploye.dart';
import 'package:project/view/Employee/Tab_Employee/Home_Tab.dart';

import '../../../constants.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  AppCubit appCubit = AppCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "ُEmployee",
        search: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: defaultButton(
              function: () {
                navigateAndFinish(context, TabNewEmployee());
              },
              width: double.infinity,
              text: "Add New Employee",
              background: kPrimaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                Text(
                  "Employee",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "List (20)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
              Container(
                height: MediaQuery.of(context).size.height *0.6,
                child:FutureBuilder<AllEmployeesModel>(
                  future: appCubit.getEmployees(),
                  builder: (context, snapshot) {
                    print(snapshot);
                    if(snapshot.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) =>
                              listEmployee(
                                  snapshot.data.users[index],
                                  context),
                          separatorBuilder: (context, index) =>
                              Container(
                                height: 6.0,
                                color: Colors.grey[300],
                              ),
                          itemCount: snapshot.data.users.length);
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                ),
              ),


        ],
      ),
    );
  }

// class AddEmployee extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => AppCubit()..getallEmployee(),
//       child: BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) => {
//
//         },
//         builder: (context, state) => SafeArea(
//           child:
//         ),
//       ),
//     );
//   }

  Widget listEmployee(model,
    context,
  ) =>
      GestureDetector(
        onTap: () {
          navigateAndFinish(
              context,
              HomeTabDetails(
                tabModel: model,
              ));
        },
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kPrimaryColor),
                          child: Center(
                            child: Text(
                              "${model.id}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 65,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image(
                        image: NetworkImage(
                            "https://active4web.com/ECC/${model.iqamaphoto}"
                            // "https://static.remove.bg/remove-bg-web/8be32deab801c5299982a503e82b025fee233bd0/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg"
                            ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${model.name}",
                    // "Mohamed AHmed",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${model.type}",
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${model.employeetype}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),

              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        value: 'edit',
                        child: InkWell(
                          onTap: (){
                            navigateTo(context, TabNewEmployee());
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_rounded,
                                size: 18,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text('Edit'),
                            ],
                          ),
                        )),

                  ];
                },
                onSelected: (String value) {
                  print('You Click on po up menu item $value');
                },
              )
              //   ],
              // )
            ],
          ),
        ),
      );
}
