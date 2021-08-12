import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/model/location/all_location_model.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/view/Employee/Eng%20Nasser/Add_Location.dart';

import '../../constants.dart';
import '../../getSharedPrefrences.dart';

class Locations_Screens extends StatefulWidget {
  const Locations_Screens({Key key}) : super(key: key);

  @override
  _Locations_ScreensState createState() => _Locations_ScreensState();
}

class _Locations_ScreensState extends State<Locations_Screens> {
  AppCubit appCubit = AppCubit();
  String location;

  Future<void> getAllPermissions() async {
    location = await getSharedPrefrences("add_Locations");

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
        title: 'Locations',
        canPop: true,
        haveBell: true,
        haveNotf: true,
        search: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            location == "yes"
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: defaultButton(
                        text: "Add Location",
                        color: kPrimaryColor,
                        onPressed: () async {
                          PermissionStatus status =
                              await Permission.location.request();
                          if (status.isDenied) {
                            return Future.error(
                                'Location permissions are denied');
                          }
                          print(status.isGranted);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddLocationScreen(null)));
                        }),
                  )
                : SizedBox(),
            FutureBuilder<AllLocationsModel>(
                future: appCubit.getLocations(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.locations.length,
                        itemBuilder: (context, pos) {
                          CameraPosition _kGooglePlex;
                          List<Marker> _markers = <Marker>[];
                          Completer<GoogleMapController> _controller =
                              Completer();
                          _kGooglePlex = CameraPosition(
                            target: LatLng(
                                double.parse(snapshot.data.locations[pos].lat),
                                double.parse(
                                    snapshot.data.locations[pos].lang)),
                            zoom: 10,
                          );
                          _markers.add(Marker(
                            markerId: MarkerId('1'),
                            position: LatLng(
                                double.parse(snapshot.data.locations[pos].lat),
                                double.parse(
                                    snapshot.data.locations[pos].lang)),
                            // infoWindow: InfoWindow(
                            //     title: 'The title of the marker'
                            // )
                          ));
                          return Card(
                            elevation: 8,
                            child: Container(
                                height: MediaQuery.of(context).size.height * .3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: GoogleMap(
                                        mapType: MapType.normal,
                                        initialCameraPosition: _kGooglePlex,
                                        zoomGesturesEnabled: true,
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          _controller.complete(controller);
                                        },
                                        markers: Set<Marker>.of(_markers),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(snapshot
                                              .data.locations[pos].title),
                                        ),
                                        Spacer(),
                                        location == "yes"
                                            ? PopupMenuButton(
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
                                                onSelected:
                                                    (String value) async {
                                                  if (value == "edit") {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddLocationScreen(
                                                                    snapshot
                                                                        .data
                                                                        .locations[
                                                                            pos]
                                                                        .id
                                                                        .toString())));
                                                  } else {
                                                    bool response =
                                                        await appCubit
                                                            .DeleteLocation(
                                                                snapshot
                                                                    .data
                                                                    .locations[
                                                                        pos]
                                                                    .id
                                                                    .toString());
                                                    setState(() {});
                                                    if (response) {
                                                      showToast(
                                                          text:
                                                              "Location Deleted successfully");
                                                    } else {}
                                                  }
                                                },
                                              )
                                            : SizedBox(),
                                      ],
                                    )
                                  ],
                                )),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
