import 'package:flutter/material.dart';
import 'package:project/model/AllEmployeeModel.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsEmployee extends StatelessWidget {
  final Users detailsmodel;

  const DetailsEmployee({Key key, this.detailsmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return
    // BlocProvider(
    //   create: (BuildContext context) => AppCubit(),
    //   child: BlocConsumer<AppCubit, AppStates>(
    //       listener: (context, state) => {},
    //       builder: (context, state) {
    //         var cubit = AppCubit.get(context).getAllEmployee;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              detailsImage(detailsmodel),
              details2(detailsmodel, context),
              line(
                  context: context,
                  name: "Iqama or id",
                  branch: "${detailsmodel.id}"),
              line(
                  context: context,
                  name: "End Date",
                  branch: "${detailsmodel.iqamaEndDate}"),
              line(
                  context: context,
                  name: "Passport name",
                  branch: "${detailsmodel.name}"),
              line(
                  context: context,
                  name: "End Date",
                  branch: "${detailsmodel.passportEndDate}"),
              SizedBox(
                height: 5,
              ),
              text(),
              line(
                  context: context,
                  name: "Joining Data",
                  branch: "${detailsmodel.joiningDate}"),
              line(
                  context: context,
                  name: "Contract End",
                  branch: "${detailsmodel.contractDate}"),
              line(
                  context: context,
                  name: "Working Start Time",
                  branch: "${detailsmodel.workStart}"),
              line(
                  context: context,
                  name: "Working End Time",
                  branch: "${detailsmodel.workEnd}"),
              line(
                  context: context,
                  name: " working day",
                  branch: "${detailsmodel.workDayes}"),
              SizedBox(
                height: 5,
              ),
              text(),
              line(
                  context: context,
                  name: "Basic Salary",
                  branch: "${detailsmodel.salary}"),
              line(
                  context: context,
                  name: "Accomdition allowance",
                  branch: "200 SAR"),
              line(
                  context: context,
                  name: "Transpaction allowance",
                  branch: "200 SAR"),
              line(
                  context: context, name: "Phone allowance", branch: "200 SAR"),
              line(
                  context: context, name: "Phone allowance", branch: "200 SAR"),
              line(
                  context: context,
                  name: "Sub Employee (Multiple)",
                  branch: "Mohamed ahmed , Esayed ated "),
              line(
                  context: context,
                  name: "Detection /Boncing",
                  branch: "Mohamed ahmed , Esayed ated "),
              line(
                  context: context,
                  name: "Vaction Approval",
                  branch: "Mohamed ahmed , Esayed ated "),
              line(
                  context: context,
                  name: "Report Approval",
                  branch: "Mohamed ahmed , Esayed ated "),
              SizedBox(
                height: 5,
              ),
              text(),
              Padding(
                padding: EdgeInsets.all(6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Documentions",
                      style: TextStyle(
                          color: Colors.red.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              bottom(
                  text: "iqama Photo",
                  function: () {
                    launch(
                        "https://active4web.com/ECC/${detailsmodel.iqamaphoto}");
                  }),
              bottom(
                  text: "Passport Photo",
                  function: () {
                    launch(
                        "https://active4web.com/ECC/${detailsmodel.passportPhoto}");
                  }),
              bottom(
                  text: "Contract File",
                  function: () {
                    launch(
                        "https://active4web.com/ECC/${detailsmodel.contractFile}");
                  }),
              bottom(
                  text: "Other File",
                  function: () {
                    launch(
                        "https://active4web.com/ECC/${detailsmodel.otherFiles}");
                  }),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      launch("tel://${detailsmodel.phone}");
                      // UrlLauncher.launch('tel:+${"0120302"}');
                    },
                    child: Text(
                      "Call",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image(
                              image: AssetImage("assets/images/event.png")),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    defaultButton(
                        width: MediaQuery.of(context).size.width - 100,
                        text: "Export")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    //   ),
    //   fallback: (context) => Center(child: CircularProgressIndicator()),
    // );

    //       }),
    // );
  }

  Widget detailsImage(
    Users model,
  ) =>
      Container(
        height: 120,
        color: Color(0xffFCECE4),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://active4web.com/ECC/${model.company.photo}"
                            // "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"
                            ),
                        fit: BoxFit.cover)),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Employee No.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Postion",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Employee Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "32",
                      style: TextStyle(
                          color: Colors.brown.shade200,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Mohamed",
                      style: TextStyle(
                          color: Colors.brown.shade200,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "tichnical",
                      style: TextStyle(
                          color: Colors.brown.shade200,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Regular",
                      style: TextStyle(
                          color: Colors.brown.shade200,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
  Widget details2(Users model, context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Contact Phone",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 110,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "000",
                            style: TextStyle(
                                color: Colors.brown.shade200,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Reset",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "${model.phone}",
                        style: TextStyle(
                            color: Colors.brown.shade200,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "${model.email}",
                        style: TextStyle(
                            color: Colors.brown.shade200,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );

  Widget line({context, String name, String branch}) => Padding(
        padding: EdgeInsets.only(top: 8, left: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    branch,
                    style: TextStyle(
                        color: Colors.brown.shade200,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget text() => Text(
        "  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
        style: TextStyle(color: Colors.grey),
      );

  Widget bottom({String text, Function function}) => Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Icon feather-eye.png"))),
                      ),
                      onPressed: () {}),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: function,
                          child: Text(
                            "View",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        // Text(
                        //   "______",
                        //   style: TextStyle(
                        //       color: Colors.red,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 16),
                        // )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      );

  widget({Column child}) {}
}
