import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/shared/cubit/app_cubit.dart';

class AddLocationScreen extends StatefulWidget {
  String id;

  AddLocationScreen(this.id);

  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  var locationTitleController = TextEditingController();
  var locationNameController = TextEditingController();
  Position currentPosition;
  AppCubit appCubit = AppCubit();
  bool progress = false;
  Map formData;
  LocationResult result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.id == null) {
      formData = {
        "title": "",
        "location": "",
        "lat": "",
        "lang": "",
      };
    } else {
      formData = {
        "title": "",
        "location": "",
        "lat": "",
        "lang": "",
        "location_id": ""
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mycustomAppbar(
        context: context,
        title: 'Locations',
        search: false,
        haveNotf: true,
        havebell: true,
        canpop: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.id == null
                  ? 'Create New Location'
                  : 'Edit Location Location',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: locationTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "Location Title",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: locationNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      labelText: "Location Url",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    setLocation().then((value) => Fluttertoast.showToast(
                        msg: "Location active",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        fontSize: 16.0));
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/Group 1894.png"),
                  ),
                ),
              ],
            ),
            Spacer(),
            !progress
                ? InkWell(
                    onTap: () async {
                      setState(() {
                        progress = true;
                      });
                      formData['title'] = locationTitleController.text;
                      formData['location'] = locationNameController.text;
                      if (widget.id == null) {
                        bool response = await appCubit.AddLocations(formData);
                        setState(() {
                          progress = false;
                        });
                        if (response) {
                          Fluttertoast.showToast(
                              msg: "Location added successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Location failed add",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              fontSize: 16.0);
                        }
                      } else {
                        print(formData['title']);
                        formData['location_id'] = widget.id;
                        bool response = await appCubit.EditLocations(formData);
                        setState(() {
                          progress = false;
                        });
                        if (response) {
                          Fluttertoast.showToast(
                              msg: "Location Edited successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Location failed edit",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              fontSize: 16.0);
                        }
                      }
                    },
                    child: defaultButtonnew(
                        text: 'Save Location',
                        onPressed: () {
                          appCubit.AddLocations({
                            "title": locationTitleController.text,
                            "location": locationNameController.text,
                            "lat": result.latLng.latitude,
                            "lang": result.latLng.longitude,
                          });
                        }))
                : Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   return await Geolocator.getCurrentPosition();
  // }

  // Future<dynamic> chooseLocation() {
  //   return Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PlacePicker(
  //         apiKey:
  //             "AIzaSyCfWNFISwvh5ofsYo04S0aA96-2HRrRBgY", // Put YOUR OWN KEY here.
  //         onPlacePicked: (result) {
  //           print(result.adrAddress);
  //           locationNameController.text = result.adrAddress;
  //           formData['lat'] = result.geometry.location.lat;
  //           formData['lang'] = result.geometry.location.lat;
  //           Navigator.of(context).pop();
  //         },
  //
  //         useCurrentLocation: true,
  //       ),
  //     ),
  //   );
  // }

  Future setLocation() async {
    result = await showLocationPicker(
      context,
      "AIzaSyCfWNFISwvh5ofsYo04S0aA96-2HRrRBgY",
      myLocationButtonEnabled: true,
      layersButtonEnabled: true,
    );
    print(result);
    setState(() {
      locationNameController.text = result.latLng.toString();
      formData['title'] = locationTitleController.text;
      formData['location'] = locationNameController.text;
      formData['lat'] = result.latLng.latitude;
      formData['lang'] = result.latLng.longitude;
    });
  }
}
