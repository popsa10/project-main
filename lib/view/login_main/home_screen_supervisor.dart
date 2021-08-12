import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/getSharedPrefrences.dart';
import 'package:project/model/Profile.dart';
import 'package:project/model/location/all_location_model.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/view/Menu/MenuHome.dart';
import 'package:project/view/notifications/all_notification_screen.dart';
import 'package:project/view/reports/reports.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';

class HomeScreenSupervisor extends StatefulWidget {
  const HomeScreenSupervisor({Key key}) : super(key: key);

  @override
  _HomeScreenSupervisorState createState() => _HomeScreenSupervisorState();
}

class _HomeScreenSupervisorState extends State<HomeScreenSupervisor> {
  final bool haveNotf = true;
  AppCubit appCubit = AppCubit();

  List<Locations> locationsList = [];
  Locations location;

  var add_reports;

  Future<void> getAllPermissions() async {
    add_reports = await getSharedPrefrences("add_reports");

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPermissions();
    getLocations();
  }

  Future<void> getLocations() async {
    AllLocationsModel allEmployeesModel = await appCubit.getLocations();
    allEmployeesModel.locations.forEach((element) {
      locationsList.add(element);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                exit(0);
              },
              icon: Image.asset(
                "assets/images/logout (2).png",
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Image.asset(
                "assets/images/Icon ionic-md-refresh.png",
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                navigateTo(context, AllNotificationScreen());
              },
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 30,
                    color: Colors.white,
                  ),
                  if (haveNotf)
                    Container(
                      height: 10,
                      width: 10,
                      decoration: new BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    )
                ],
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/Mask Group 31.png",
            ),
            onPressed: () {
              navigateTo(context, MenuScreen());
            },
          ),
        ],
      ),
      body: FutureBuilder<Profile>(
          future: appCubit.getProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height * 0.3,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(20),
                            bottomEnd: Radius.circular(20)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultText(
                                  text: "Welcome",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff8A959E)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      defaultText(
                                        text: snapshot.data.user.name,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      defaultText(
                                          text: snapshot.data.user.type,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: const Color(0xffEDF0F8)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  defaultText(
                                      text: "TASKS UPDATE",
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  chartBox(
                                      "assets/images/circular progress 1.png",
                                      "Regular",
                                      snapshot.data.numongoing),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  chartBox(
                                      "assets/images/circular progress 3.png",
                                      "Completed",
                                      snapshot.data.numcompleted),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  chartBox(
                                      "assets/images/circular progress.png",
                                      "Delayed",
                                      snapshot.data.numdelay),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        if (location != null) {
                                          if (await getSharedPrefrences(
                                                      "checkIn") ==
                                                  null ||
                                              await getSharedPrefrences(
                                                      "checkIn") ==
                                                  "false") {
                                            Position pos =
                                                await _determinePosition();
                                            double dis =
                                                Geolocator.distanceBetween(
                                                    pos.latitude,
                                                    pos.longitude,
                                                    double.parse(location.lat),
                                                    double.parse(
                                                        location.lang));
                                            if (dis <= 100) {
                                              SharedPreferences preferences =
                                                  await SharedPreferences
                                                      .getInstance();
                                              preferences.setString(
                                                  "checkIn", "true");
                                              preferences.setString("locId",
                                                  location.id.toString());
                                              preferences.setString("checkTime",
                                                  "${DateTime.now().hour}:${DateTime.now().minute}");
                                              preferences.setString("checkDate",
                                                  "${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}");
                                              appCubit.checkIn(
                                                  userid:
                                                      await getSharedPrefrences(
                                                          "id"),
                                                  location: location.id,
                                                  date:
                                                      "${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}",
                                                  time:
                                                      "${DateTime.now().hour}:${DateTime.now().minute}");
                                              Fluttertoast.showToast(
                                                  msg: "تم تسجيل الحضور بنجاح",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  fontSize: 16.0);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "You are so far from this location",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  fontSize: 16.0);
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Already Check in",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please Select Your Location",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              fontSize: 16.0);
                                        }
                                      },
                                      child: box("assets/images/enter (1).png",
                                          "Check in", size)),
                                  InkWell(
                                      onTap: () async {
                                        if (await getSharedPrefrences(
                                                "checkIn") ==
                                            "true") {
                                          Position pos =
                                              await _determinePosition();
                                          double dis =
                                              Geolocator.distanceBetween(
                                                  pos.latitude,
                                                  pos.longitude,
                                                  double.parse(location.lat),
                                                  double.parse(location.lang));
                                          if (dis <= 100) {
                                            SharedPreferences preferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            preferences.setString(
                                                "checkIn", "false");
                                            appCubit.checkOut(
                                                userid:
                                                    await getSharedPrefrences(
                                                        "id"),
                                                location: location.id,
                                                date:
                                                    "${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}",
                                                time:
                                                    "${DateTime.now().hour}:${DateTime.now().minute}");
                                            Fluttertoast.showToast(
                                                msg: "تم تسجيل انصراف بنجاح",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                fontSize: 16.0);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "You are so far from this location",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Already Check out",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              fontSize: 16.0);
                                        }
                                      },
                                      child: box("assets/images/logout (-1.png",
                                          "Check out", size))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Shoud be in 100mm max from location",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              FutureBuilder<AllLocationsModel>(
                                  future: appCubit.getLocations(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      print(
                                          "pppppppp${snapshot.data.locations}");
                                      return customDropdownMenu(
                                          onChanged: (value) {
                                            setState(() {
                                              location = value;
                                              print(location);
                                            });
                                          },
                                          itemList: locationsList
                                              .map<DropdownMenuItem<Locations>>(
                                                  (Locations value2) {
                                            return DropdownMenuItem<Locations>(
                                              value: value2,
                                              child: Container(
                                                  width: 90,
                                                  child: Text(value2.title)),
                                            );
                                          }).toList(),
                                          hintText: "Locations",
                                          value: location ?? null,
                                          label: "Choose Location(single)");
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  }),
                              add_reports == "yes"
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: defaultButton(
                                          text: "Add Report",
                                          onPressed: () {
                                            navigateTo(context, Reports());
                                          },
                                          color: kPrimaryColor),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 15,
                              ),
                              // Text(
                              //   "New Tasks",
                              //   style: TextStyle(
                              //     fontSize: 17,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        // ListView.separated(
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemBuilder: (context, index) => buildTask(size),
                        //     separatorBuilder: (context, index) =>
                        //         SizedBox(
                        //           height: 10,
                        //         ),
                        //     itemCount: 1),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text("Notifications",
                        //       style:
                        //       TextStyle(fontSize: 17,
                        //           fontWeight: FontWeight.bold)),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // ListView.separated(
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemBuilder: (context, index) =>
                        //         buildNotificationCard(context),
                        //     separatorBuilder: (context, index) =>
                        //         SizedBox(
                        //           height: 10,
                        //         ),
                        //     itemCount: 2),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Stack buildTask(Size size) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: size.height * 0.15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "6 june 2021 ----- 6 june 2021",
                  style: TextStyle(color: kGreyColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Design Landscape",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "More Details",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 10,
          height: 80,
          decoration: BoxDecoration(
              color: Color(0xffFFA007),
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(10),
                  bottomEnd: Radius.circular(10))),
        )
      ],
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}

Widget box(String image, String text, Size size) => Container(
      width: size.width * 0.40,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 120,
            height: 100,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );

Widget chartBox(
  String image,
  String text,
  int number,
) =>
    Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 70,
            height: 56,
          ),
          const SizedBox(
            height: 5,
          ),
          defaultText(
              text: text,
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 5,
          ),
          defaultText(
              text: number.toString(),
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ],
      ),
    );

Widget buildNotificationCard(context) => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "6 june 2021",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Mohamed Ahmed add report",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
