import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class ReportDetails extends StatefulWidget {
  final Reports modelDetails;

  const ReportDetails({Key key, this.modelDetails}) : super(key: key);

  @override
  _ReportDetailsState createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppsCubit(),
      child: BlocConsumer<AppsCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: mycustomAppbar(
                context: context,
                title: 'Report Details',
                canpop: true,
                havebell: true,
                haveNotf: true,
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customrow(title: 'Report Date', val: '1-June -2021'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                            topEnd: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customrow(
                              title: 'Location',
                              val: '${widget.modelDetails.locationId}'),
                          customrow(
                              title: 'Target',
                              val: '${widget.modelDetails.target}'),
                          customrow(
                              title: 'Report Approved by',
                              val: '${widget.modelDetails.user.name}'),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Achievements',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('${widget.modelDetails.achievements}'),
                          // 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa'),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Problems',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('${widget.modelDetails.problems}'),
                          // 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa'),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Image.network(
                                      "https://active4web.com/ECC/${widget.modelDetails.user.iqamaphoto}",
                                      // "assets/images/download.png",
                                      fit: BoxFit.fill,
                                    ),
                                    height: 100,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Image.network(
                                      "https://active4web.com/ECC/${widget.modelDetails.user.insurancePhoto}",
                                      // "assets/images/download.png",
                                      fit: BoxFit.fill,
                                    ),
                                    height: 100,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text('file.docx'),
                              Spacer(),
                              Image.network(
                                  "assets/images/Icon feather-eye.png"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    launch(
                                        "https://active4web.com/ECC/${widget.modelDetails.file1}");
                                  },
                                  child: Text(
                                    'view',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Task Report',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          customrow(
                              title: 'Task Name',
                              val: '${widget.modelDetails.taskId}'),
                          customrow(
                              title: 'Note',
                              val: '${widget.modelDetails.note}'),
                          SizedBox(
                            height: 16,
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 62.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: const Color(0xFF039712),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        AppsCubit.get(context)
                                            .acceptReport(1, 1);
                                      },
                                      child: Text(
                                        'Accept',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 62.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: const Color(0xFFAC2929),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        AppsCubit.get(context)
                                            .cancelReport(1, 1);
                                      },
                                      child: Text(
                                        'Reject',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 62.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: const Color(0xFF303D31),
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                              'Send Notes',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: TextFormField(
                                              controller: noteController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 2),
                                                ),
                                                hintText:
                                                    "Send Note To Employee",
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintStyle: const TextStyle(
                                                    color: Color(0xffC8C8C8),
                                                    fontSize: 11),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 18),
                                                child: defaultButton(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100,
                                                    background: kPrimaryColor,
                                                    text: "Send",
                                                    function: () {
                                                      AppsCubit.get(context)
                                                          .sendNote(
                                                              noteController
                                                                  .text,
                                                              widget
                                                                  .modelDetails
                                                                  .user
                                                                  .name);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Note',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }

  ///// open path ////
  var openResult = 'Unknown';
  Future<void> openFile(String url) async {
    var filePath = url;
    var result = await FilePicker.getFile();

    if (result != null) {
      filePath = result.path;
    } else {
      // User canceled the picker
    }
    final _result = await OpenFile.open(filePath);
    print(_result.message);

    setState(() {
      openResult = "type=${_result.type}  message=${_result.message}";
    });
  }

  // launchURL(String ur) async {
  //   const url = 'https://active4web.com/ECC${mo}';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
