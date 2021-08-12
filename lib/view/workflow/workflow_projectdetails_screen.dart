import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/view/project/task_detail.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../../getSharedPrefrences.dart';
import 'new_task_screen.dart';

class WorkFlowProjectDetails extends StatefulWidget {
  final Project model;
  WorkFlowProjectDetails({Key key, this.model}) : super(key: key);
  @override
  _WorkFlowProjectDetailsState createState() => _WorkFlowProjectDetailsState();
}

class _WorkFlowProjectDetailsState extends State<WorkFlowProjectDetails> {

  final TextEditingController searchController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String tasks;

  Future<void> getAllPermissions() async {

    tasks = await getSharedPrefrences("add_task");

    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPermissions();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Workflow",
          search: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultText(
                    text: widget.model.name,
                    color: kTitleColor,
                    fontWeight: FontWeight.normal),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 3.w,
                                    height: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kGreenColor),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  defaultText(
                                      text: "Completed",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  defaultText(
                                      text: "3",
                                      color: Colors.grey,
                                      fontSize: 16)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 3.w,
                                    height: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  defaultText(
                                      text: "In Progress",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  defaultText(
                                      text: "12",
                                      color: Colors.grey,
                                      fontSize: 16)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 3.w,
                                    height: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kRedColor),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  defaultText(
                                      text: "Delayed",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  SizedBox(
                                    width: 10.5.w,
                                  ),
                                  defaultText(
                                      text: "5",
                                      color: Colors.grey,
                                      fontSize: 16)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      tasks=="yes"?Row(
                        children: [
                          Expanded(
                            child: defaultButton(
                              text: "Create New Task",
                              onPressed: () {
                                navigateTo(
                                    context,
                                    NewTaskScreen(
                                      id: widget.model.id.toString(),type: "add",
                                    ));
                              },
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          defaultButton(
                            text: "Add Note",
                            width: 30.w,
                            onPressed: () {
                              addNote(context, () {
                                AppCubit.get(context)
                                    .sendNote(noteController.text,
                                    widget.model.employees.first.name)
                                    .then((value) {
                                  showToast(text: "Note Add Successfully");
                                });
                              }, noteController);
                            },
                          ),
                        ],
                      ):SizedBox(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defaultText(
                        text: "Project tasks",
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    defaultText(
                        text: "${widget.model.task.length} quantity",
                        color: kGreyColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildProjectTasksCard(context, widget.model.task[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
                  itemCount: widget.model.task.length),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProjectTasksCard(context, Task model) => Stack(
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
                    width: 1.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          text:
                          "${DateFormat("yyyy-MM-dd").format(DateTime.parse(model.start))} - - - - - ${DateFormat("yyyy-MM-dd").format(DateTime.parse(model.end))}",
                          color: kTitleColor,
                          fontSize: 12),
                      SizedBox(
                        height: 1.h,
                      ),
                      defaultText(
                          text: "Task :  ${model.name}",
                          color: kGreyColor,
                          fontSize: 12),
                      SizedBox(
                        height: 1.h,
                      ),
                      defaultText(
                          text: "Task Admin :   ${model.users}",
                          color: kGreyColor,
                          fontSize: 12),
                      SizedBox(
                        height: 1.h,
                      ),
                      defaultText(
                          text: "Assigned To",
                          color: kGreyColor,
                          fontSize: 12),
                      SizedBox(
                        height: 1.h,
                      ),

                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        // CircleAvatar(
                        //   radius: 9.w,
                        //   backgroundColor: Colors.grey,
                        // ),
                        SizedBox(
                          height: 2.h,
                        ),
                        defaultText(
                          text: model.status == 2
                              ? "Completed"
                              : model.status == 1
                              ? "inProgress"
                              : "Delayed",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: model.status == 2
                              ? kGreenColor
                              : model.status == 1
                              ? Colors.yellow
                              : kRedColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  tasks=="yes"?PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'edit',
                          child: InkWell(
                              onTap: (){
                                navigateTo(context,NewTaskScreen(id: widget.model.id.toString(),type: "edit",));
                              },
                              child: Text('Edit')),
                        ),
                        PopupMenuItem(

                          value: 'delete',
                          child: InkWell(
                              onTap: () {
                                AppCubit.get(context).deleteTask(model.id);
                              },
                              child: Text('Delete')),
                        )
                      ];
                    },
                    onSelected: (String value) {
                      print('You Click on po up menu item $value');
                    },
                  ):SizedBox()
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 1,
                color: kGreyColor,
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        navigateTo(
                            context,
                            TaskDetails(
                              model: model,
                            ));
                      },
                      child: defaultText(
                          text: "More detailed",
                          color: kTitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        addNote(context, () {
                          AppCubit.get(context)
                              .sendNote(noteController.text, model.users)
                              .then((value) {
                            showToast(text: "Note Add Successfully");
                          });
                        }, noteController);
                      },
                      child: Text(
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
        width: 3.w,
        height: 11.h,
        decoration: BoxDecoration(
            color: model.status == 2
                ? kGreenColor
                : model.status == 1
                ? Colors.yellow
                : kRedColor,
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                bottomEnd: Radius.circular(20))),
      ),
    ],
  );
}

