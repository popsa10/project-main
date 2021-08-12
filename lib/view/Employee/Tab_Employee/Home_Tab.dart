import 'package:flutter/material.dart';
import 'package:project/model/AllEmployeeModel.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Eng%20Nasser/Bounce_Screen.dart';
import 'package:project/view/Employee/Eng%20Nasser/Report.dart';
import '../../../constants.dart';
import 'Details_Employes.dart';
import 'ReportEmployee.dart';
import 'SalaryEmployee.dart';
import 'Tasks/Tasks.dart';
import 'VacationsEmployee.dart';
import 'attentanceEmploye.dart';

class HomeTabDetails extends StatefulWidget {
  final Users tabModel;

  const HomeTabDetails({Key key, this.tabModel}) : super(key: key);

  @override
  _HomeTabDetailsState createState() => _HomeTabDetailsState();
}

class _HomeTabDetailsState extends State<HomeTabDetails>
    with TickerProviderStateMixin {
  List<Widget> tabs = [
    Text("Details"),
    Text("attentence"),
    Text("Vaction"),
    Text("salary"),
    Text("Tasks"),
    Text("Report"),
    Text("Eng Nasser"),
    Text("Location"),
  ];

  List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CustomAppBar(title: "Mohamed Ahmed  ", search: false),
        //  CustomAppBarTab(title: "Mohamed Ahmed", search: false),
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              controller: tabController,
              tabs: tabs,
              labelColor: kTitleColor,
              physics: BouncingScrollPhysics(),
              indicatorColor: kRedColor,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              labelPadding: EdgeInsets.only(top: 15, right: 15, bottom: 15),
              unselectedLabelColor: kGreyColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: screens = [
                DetailsEmployee(
                  detailsmodel: widget.tabModel,
                ),
                AttentanceEmploye(),
                VacationsScrren(),
                SalaryScreen(
                  salarymodel: widget.tabModel,
                ),
                TasksScreen(),
                ReportEmployee(),
                ReportsScreen(),
                LocationScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
