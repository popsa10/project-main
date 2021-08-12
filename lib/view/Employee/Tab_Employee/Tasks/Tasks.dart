import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/AllTasksModel.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';
import 'package:project/view/Employee/Tab_Employee/Tasks/AddNewTask.dart';
import 'package:project/view/Employee/TaskDetails/TaskDetails.dart';
import '../../../../constants.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController sendNotification = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppsCubit()..getAllTasks(),
      child: BlocConsumer<AppsCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return
                // Scaffold(
                //   body:
                //   Expanded(
                // child: Container(
                //   color: Colors.grey.shade200,
                //   // height: MediaQuery.of(context).size.height,
                //   // width: MediaQuery.of(context).size.width,
                //   child:
                SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Center(
                      child: defaultButton(
                          width: MediaQuery.of(context).size.width - 40,
                          background: kDefaultButtonColor,
                          function: () {
                            navigateTo(context, AddNewTaskScreen());
                          },
                          text: "Add New Tasks "),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: AppsCubit.get(context).allTasksModel != null,
                    builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount:
                          AppsCubit.get(context).allTasksModel.tasks.length,
                      itemBuilder: (context, index) => buildProjectTasksCard(
                          AppsCubit.get(context).allTasksModel.tasks[index],
                          index),
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
                //   ),
                // ),
                //  ),
              ),
            );
          }),
    );
  }

  Widget buildProjectTasksCard(Tasks model, int index) => Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(15),
                    topEnd: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 1.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              defaultText(
                                  text:
                                      "${model.users[index].insuranceStartDate} - - - - - ",
                                  color: kTitleColor,
                                  fontSize: 12),
                              defaultText(
                                  text:
                                      " ${model.users[index].insuranceEndDate}",
                                  color: kTitleColor,
                                  fontSize: 12),
                            ],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          defaultText(
                              text:
                                  "Task :                   ${model.users[index].employeetype} ",
                              color: kGreyColor,
                              fontSize: 12),
                          SizedBox(
                            height: 1.0,
                          ),
                          defaultText(
                              text:
                                  "Task Admin :     ${model.users[index].name}. ",
                              color: kGreyColor,
                              fontSize: 12),
                          SizedBox(
                            height: 1.0,
                          ),
                          defaultText(
                              text:
                                  "Assigned To :    ${model.users[index].name} ",
                              color: kGreyColor,
                              fontSize: 12),
                          SizedBox(
                            height: 1.0,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 20.0,
                              child: Image(
                                image: NetworkImage(
                                    "https://active4web.com/ECC/${model.users[index].insurancePhoto}"),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            defaultText(
                                text: "",
                                // ${model.users[index].token}
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: kGreenColor)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 1.0,
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        },
                        onSelected: (String value) {
                          print('You Click on po up menu item $value');
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  Container(
                    height: 1,
                    color: kGreyColor,
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigateTo(context, TaskDetails());
                          },
                          child: defaultText(
                              text: "More detailed",
                              color: kTitleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'Send Notes',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: TextFormField(
                                  controller: sendNotification,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    hintText: "Send Note To Employee",
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: const TextStyle(
                                        color: Color(0xffC8C8C8), fontSize: 11),
                                  ),
                                ),
                                actions: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 18),
                                    child: defaultButton(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        background: kPrimaryColor,
                                        text: "Send",
                                        function: () {
                                          AppsCubit.get(context).sendNote(
                                              sendNotification.text,
                                              model.users[index].name);
                                        }),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            "Add Note",
                            style: TextStyle(
                                color: kGreenColor,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 3.0,
            height: 9.0,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20))),
          ),
        ],
      );

  // Widget buildProjectTasksCard() => Stack(
  //       alignment: AlignmentDirectional.topStart,
  //       children: [
  //         Container(
  //           decoration: const BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadiusDirectional.only(
  //                   topStart: Radius.circular(15),
  //                   topEnd: Radius.circular(15))),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     SizedBox(
  //                       width: 1,
  //                     ),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         defaultText(
  //                             text: "6 june 2021 - - - - - 16 june 2021",
  //                             color: kTitleColor,
  //                             fontSize: 12),
  //                         SizedBox(
  //                           height: 1,
  //                         ),
  //                         defaultText(
  //                             text: "Task :  NewTask -1",
  //                             color: kGreyColor,
  //                             fontSize: 12),
  //                         SizedBox(
  //                           height: 1,
  //                         ),
  //                         defaultText(
  //                             text: "Task Admin :   Khaled Ali",
  //                             color: kGreyColor,
  //                             fontSize: 12),
  //                         SizedBox(
  //                           height: 1.0,
  //                         ),
  //                         defaultText(
  //                             text: "Assigned To",
  //                             color: kGreyColor,
  //                             fontSize: 12),
  //                         SizedBox(
  //                           height: 1.0,
  //                         ),
  //                         CircleAvatar(
  //                           radius: 25,
  //                           backgroundColor: Colors.grey[300],
  //                         ),
  //                       ],
  //                     ),
  //                     const Spacer(),
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(vertical: 20),
  //                       child: Column(
  //                         children: [
  //                           CircleAvatar(
  //                             radius: 9.0,
  //                           ),
  //                           SizedBox(
  //                             height: 2.0,
  //                           ),
  //                           defaultText(
  //                               text: "Completed",
  //                               fontSize: 13,
  //                               fontWeight: FontWeight.bold,
  //                               color: kGreenColor)
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 1.0,
  //                     ),
  //                     PopupMenuButton(
  //                       itemBuilder: (context) => [],
  //                       color: Colors.grey[100],
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 1.0,
  //                 ),
  //                 Container(
  //                   height: 1,
  //                   color: kGreyColor,
  //                 ),
  //                 SizedBox(
  //                   height: 1.0,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(right: 30),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       defaultText(
  //                           text: "More detailed",
  //                           color: kTitleColor,
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.normal),
  //                       const Text(
  //                         "Add Note",
  //                         style: TextStyle(
  //                             color: kGreenColor,
  //                             decoration: TextDecoration.underline),
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Container(
  //           width: 3.0,
  //           height: 9.0,
  //           decoration: const BoxDecoration(
  //               color: Colors.red,
  //               borderRadius: BorderRadiusDirectional.only(
  //                   topStart: Radius.circular(20),
  //                   bottomEnd: Radius.circular(20))),
  //         ),
  //       ],
  //     );

}
