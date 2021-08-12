import 'package:flutter/material.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/CreateNewEmployee/permission/Permissions.dart';

import '../../../constants.dart';
import 'CreateNewEmploye.dart';

class TabNewEmployee extends StatefulWidget {
  @override
  _TabNewEmployeeState createState() => _TabNewEmployeeState();
}

class _TabNewEmployeeState extends State<TabNewEmployee>
    with TickerProviderStateMixin {
  List<Widget> tabs = [
    Text("Details          "),
    Text("  User_Permission"),
  ];
  List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CustomAppBar(title: "New Employee", search: false),
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
              labelPadding:
                  EdgeInsets.only(top: 15, right: 3, left: 3, bottom: 15),
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
                CreateNewEmlpoye(),
                PermissionsScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
