import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../getSharedPrefrences.dart';
import 'create_project_screen.dart';
import 'project_details.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final TextEditingController searchController = TextEditingController();
  AppCubit appCubit = AppCubit();

  var add_Projects;
  Future<void> getAllPermissions() async {
    add_Projects = await getSharedPrefrences("add_Projects");

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        canPop: false,
        haveNotf: true,
        controller: searchController,
        haveBell: true,
        title: "Projects",
        search: true,
      ),
      body: FutureBuilder<AllProjectModel>(
          future: appCubit.getProjects(),
          builder: (context, state) {
            if (state.hasData) {
              final model = state.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    add_Projects == "yes"
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: defaultButton(
                                text: "Add New Project",
                                onPressed: () {
                                  navigateTo(context, CreateProjectScreen());
                                },
                                color: kPrimaryColor),
                          )
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        defaultContainer(Color(0xffFBE9CC), Color(0xffFCC163),
                            "Ongoing", model.numongoing),
                        defaultContainer(Color(0xffF1FBF5), Color(0xff039712),
                            "Completed", model.numComplete),
                        defaultContainer(Color(0xffFCECE4), Color(0xffCE3827),
                            "Delay", model.numdelay),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defaultText(
                              text: "Projects List",
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          Image.asset(
                            "assets/images/Icon metro-sort-desc.png",
                            width: 5.w,
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                navigateTo(
                                    context,
                                    ProjectDetails(
                                      projectModel: model.projects[index],
                                    ));
                              },
                              child: buildProjectCard(
                                context,
                                model.projects[index],
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                        itemCount: model.projects.length),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget buildProjectCard(context, Project model) => Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              bottomStart: Radius.circular(10))),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 22.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      baseUrl + model.photo,
                    ),
                  ),
                ),
                width: double.infinity,
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: 25.w,
                height: 5.h,
                decoration: BoxDecoration(
                    color: kRedColor, borderRadius: BorderRadius.circular(10)),
                child:
                    Center(child: defaultText(text: model.type, fontSize: 15)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(
                        text: model.name,
                        color: kRedColor,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        defaultText(
                            text: "start Date :  ",
                            color: kTitleColor,
                            fontSize: 13),
                        defaultText(
                            text: DateFormat("yyyy-MM-dd")
                                .format(DateTime.parse(model.startDate)),
                            color: kGreyColor,
                            fontSize: 13)
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        defaultText(
                            text: "Deadline :    ",
                            color: kTitleColor,
                            fontSize: 13),
                        defaultText(
                            text: DateFormat("yyyy-MM-dd")
                                .format(DateTime.parse(model.deadline)),
                            color: kGreyColor,
                            fontSize: 13)
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    // CircleAvatar(
                    //   radius: 10.w,
                    // ),
                    SizedBox(
                      height: 2.h,
                    ),
                    defaultText(
                        text: model.status == 0
                            ? "Delayed"
                            : model.status == 1
                                ? "Ongoing"
                                : "Completed",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: model.status == 0
                            ? kRedColor
                            : model.status == 1
                                ? Colors.yellow.shade900
                                : kGreenColor)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );

Widget defaultContainer(
        Color color, Color borderColor, String text, int number) =>
    Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          defaultText(
              text: "$number",
              color: Color(0xff707070),
              fontWeight: FontWeight.bold),
          defaultText(
            text: text,
            color: Color(0xff707070),
          )
        ],
      ),
    );
