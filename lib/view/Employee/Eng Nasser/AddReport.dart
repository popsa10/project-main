import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:project/getSharedPrefrences.dart';
import 'package:project/model/AllTasksModel.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/model/vehicle/GetAllLocation.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';

class CreateReport extends StatefulWidget {
  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  Locations locationname;
  List<Tasks> tasksname = [];
  TextEditingController target = TextEditingController();
  TextEditingController achievement = TextEditingController();
  TextEditingController problem = TextEditingController();
  List<TextEditingController> note = [TextEditingController()];

  List<TextEditingController> percentage = [TextEditingController()];
  List<Project> projectsList = [];
  AppCubit appCubit = AppCubit();
  List<Project> project;

  Future<void> getProjects() async {
    AllProjectModel allEmployeesModel = await appCubit.getProjects();
    allEmployeesModel.projects.forEach((element) {
      projectsList.add(element);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getProjects();
    super.initState();
  }

  var tasksCount = 1;

  bool progress = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppsCubit()
        ..getLocation()
        ..getAllTasks(),
      child: BlocConsumer<AppsCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: CustomAppBar(
                  title: 'Add Report',
                  canPop: true,
                  haveBell: true,
                  haveNotf: true),
              body: AppsCubit.get(context).getAllLocation != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConditionalBuilder(
                              condition: state is! AppLoadingGetLocation,
                              builder: (context) {
                                return MultiSelectDialogField(
                                  height: 60,
                                  title: Text("Choose from Projects"),
                                  searchHint: "Choose from Projects",
                                  buttonText: Text("Choose from Projects"),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  items: projectsList
                                      .map((e) => MultiSelectItem(e, e.name))
                                      .toList(),
                                  listType: MultiSelectListType.CHIP,
                                  onConfirm: (values) {
                                    project = values;
                                  },
                                );
                              },
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),

                            // TextField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide: BorderSide(color: Colors.grey)),
                            //     labelText: "Select Location",
                            //   ),
                            // ),

                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: target,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Target",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: achievement,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Achievement",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: problem,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Problems",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   'Attach Photos (Optional)',
                            //   style: TextStyle(
                            //       fontSize: 18, fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Row(
                            //   children: [
                            //     uploadFile(function: () {
                            //       AppCubit.get(context).uploadFileReport();
                            //     }),
                            //     SizedBox(
                            //       width: 8,
                            //     ),
                            //     uploadFile(function: () {
                            //       // AppCubit.get(context).uploadFileReport();
                            //       AppCubit.get(context).addReport(
                            //           locationid: 1,
                            //           userid: 1,
                            //           target: target.text,
                            //           achievements: achievement.text,
                            //           problems: problem.text,
                            //           file1:
                            //               AppCubit.get(context).fileAddReport,
                            //           file2:
                            //               AppCubit.get(context).fileAddReport2,
                            //           file3:
                            //               AppCubit.get(context).fileAddReport3,
                            //           file4:
                            //               AppCubit.get(context).fileAddReport4,
                            //           taskid: 1,
                            //           note: note.text);
                            //     })
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Row(
                            //   children: [
                            //     uploadFile(function: () {
                            //       AppCubit.get(context).uploadFileReport();
                            //     }),
                            //     SizedBox(
                            //       width: 8,
                            //     ),
                            //     uploadFile(function: () {
                            //       AppCubit.get(context).uploadFileReport();
                            //     })
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Text(
                              'Task Report',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: tasksCount,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        ConditionalBuilder(
                                          condition:
                                              state is! AppLoadingGetAllTasks,
                                          builder: (context) {
                                            var dropdownButton = DropdownButton(
                                              hint: Text(
                                                  'Please choose a Tasks                '),
                                              // Not necessary for Option 1
                                              value:
                                                  tasksname.length != tasksCount
                                                      ? null
                                                      : tasksname[index],
                                              onChanged: (newValue) {
                                                setState(() {
                                                  tasksname.add(newValue);
                                                  // tasksname.removeAt(index+1);
                                                  print(tasksname[index].id);
                                                });
                                              },
                                              items: AppsCubit.get(context)
                                                  .allTasksModel
                                                  .tasks
                                                  .map((loc) {
                                                return DropdownMenuItem(
                                                  child: new Text(loc.name),
                                                  value: loc,
                                                );
                                              }).toList(),
                                              // value:locationname ,
                                            );
                                            return Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              height: 65,
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: dropdownButton,
                                            );
                                          },
                                          fallback: (context) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          controller: note[index],
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                            labelText: "Note",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          controller: percentage[index],
                                          decoration: InputDecoration(
                                            suffixIcon: Container(
                                                width: 50,
                                                alignment: Alignment.center,
                                                child: Text("%")),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                            labelText:
                                                "percentage Example :- 56",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),

                            // InkWell(
                            //   onTap: ()
                            //   {

                            //   },
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10),
                            //           borderSide: BorderSide(color: Colors.grey)),
                            //       labelText: "Select Location",
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  tasksCount++;
                                  percentage.add(TextEditingController());
                                  note.add(TextEditingController());
                                });
                              },
                              child: Text(
                                'Add Another Task',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.indigo),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: !progress
                                          ? InkWell(
                                              onTap: () async {
                                                setState(() {
                                                  progress = true;
                                                });
                                                List<String> notes = [];
                                                for (var text in note) {
                                                  notes.add(text.text);
                                                }
                                                List<String> perce = [];
                                                for (var text in percentage) {
                                                  perce.add(text.text);
                                                }
                                                List<String> tasks = [];
                                                for (var id in tasksname) {
                                                  tasks.add(id.id.toString());
                                                }

                                                print(locationname.id);
                                                print(await getSharedPrefrences(
                                                    "id"));
                                                print(target.text);
                                                print(achievement.text);
                                                print(problem.text);
                                                print(notes.join(","));
                                                print(perce.join(","));
                                                print(tasks.join(","));
                                                //////// upload to server /////
                                                await AppsCubit.get(context)
                                                    .postAddReport(
                                                  FormData.fromMap({
                                                    'project_id':
                                                        project.join(","),
                                                    'user_id':
                                                        await getSharedPrefrences(
                                                            "id"),
                                                    'target': target.text,
                                                    'achievements':
                                                        achievement.text,
                                                    'problems': problem.text,
                                                    // 'file1':
                                                    //     await MultipartFile.fromFile(
                                                    //         AppCubit.get(context)
                                                    //             .fileAddReport
                                                    //             .path,
                                                    //         filename:
                                                    //             AppCubit.get(context)
                                                    //                 .fileAddReport
                                                    //                 .path
                                                    //                 .split('/')
                                                    //                 .last),
                                                    // 'file2':
                                                    //     await MultipartFile.fromFile(
                                                    //         AppCubit.get(context)
                                                    //             .fileAddReport2
                                                    //             .path,
                                                    //         filename:
                                                    //             AppCubit.get(context)
                                                    //                 .fileAddReport2
                                                    //                 .path
                                                    //                 .split('/')
                                                    //                 .last),
                                                    // 'file3':
                                                    //     await MultipartFile.fromFile(
                                                    //         AppCubit.get(context)
                                                    //             .fileAddReport3
                                                    //             .path,
                                                    //         filename:
                                                    //             AppCubit.get(context)
                                                    //                 .fileAddReport3
                                                    //                 .path
                                                    //                 .split('/')
                                                    //                 .last),
                                                    // 'file4':
                                                    //     await MultipartFile.fromFile(
                                                    //         AppCubit.get(context)
                                                    //             .fileAddReport4
                                                    //             .path,
                                                    //         filename:
                                                    //             AppCubit.get(context)
                                                    //                 .fileAddReport4
                                                    //                 .path
                                                    //                 .split('/')
                                                    //                 .last),
                                                    'note': notes.join(","),
                                                    "percent": perce.join(","),
                                                    "task_id": tasks.join(",")
                                                  }),
                                                );
                                                setState(() {
                                                  progress = false;
                                                });
                                              },
                                              child: Container(
                                                child: Center(
                                                    child: Text(
                                                  'Submit Report',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                )),
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      const Color(0xFF293E4D),
                                                      const Color(0xFF10181E)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child:
                                                  CircularProgressIndicator())),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }

  Widget uploadFile({Function function}) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          height: 100,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Upload  File'),
                SizedBox(
                  width: 4,
                ),
                Image.asset(
                  "assets/images/upload.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
