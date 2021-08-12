import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:project/view/layout/home_layout.dart';
import 'package:project/view/notifications/all_notification_screen.dart';

import '../constants.dart';

Widget defaultButton({
  double width,
  Color background,
  Function function,
  String text,
  Function() onPressed,
}) =>
    Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: TextButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );

/////////////////// other Button ////
// Widget defaultButton1(
//         {double width,
//         Color background,
//         Function function,
//         String text,
//         Null Function() onPressed}) =>
//     Container(
//       width: width,
//       height: 55,
//       decoration: BoxDecoration(
//         color: background,
//         borderRadius: BorderRadius.circular(5),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.green,
//             offset: Offset(0.0, 1.0), //(x,y)
//             blurRadius: 2.0,
//           ),
//         ],
//       ),
//       child: TextButton(
//           onPressed: function,
//           child: Text(
//             text,
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//           )),
//     );
//////
Widget defaultTextButton({Function function, String text}) =>
    TextButton(onPressed: function, child: Text(text));

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

////////////////// Statistics button   الاحصائيات

Widget statisticsButton({Color background, String text, String textnumber}) =>
    Container(
      width: 100,
      height: 90,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 14,
          ),
          Container(
            height: 25,
            child: Text(
              textnumber,
              style: TextStyle(
                  color: Color(0xff186983),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 45,
            child: Text(text,
                style: TextStyle(
                  color: Color(0xff3E8290),
                  fontSize: 17,
                  height: 1.0,
                  letterSpacing: 1.0,
                ),
                maxLines: 2,
                // overflow: TextOverflow.clip,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );

//// //////   /////    ////   /////   ///////  / //////
Widget defaultTextField(
    {TextEditingController controller,
    Function onsubmit,
    Function onchanege,
    Function validator,
    bool isShown,
    String label,
    String hint,
    IconData icon,
    IconData suffixicon,
    Function onsave,
    bool istrue = true,
    Function suffixPressed,
    Function ontap,
    TextInputType type,
    @required BuildContext context}) {
  return TextFormField(
    controller: controller,
    onFieldSubmitted: onsubmit,
    onChanged: onchanege,
    keyboardType: type,
    onSaved: onsave,
    onTap: ontap,
    validator: validator,
    obscureText: isShown,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffixicon != null
          ? IconButton(onPressed: suffixPressed, icon: Icon(suffixicon))
          : null,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(),
    ),
  );
}

///////
////////////////////////////////////////////////////
Widget defaultButtonnew(
        {@required String text,
        Color color = kDefaultButtonColor,
        @required Function onPressed,
        double width = double.infinity,
        double height = 63,
        Color textColor = Colors.white,
        MaterialColor background}) =>
    GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

Widget defaultFormField(
        {TextEditingController controller,
        bool isPassword = false,
        @required String hintText,
        Widget suffix,
        Function onSubmit,
        Function suffixFunction,
        Function validate,
        @required TextInputType type}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffC8C8C8), fontSize: 11),
        suffixIcon: InkWell(
          onTap: suffixFunction,
          child: suffix,
        ),
        fillColor: kTextFormFieldColor,
        filled: true,
      ),
    );

Widget newTaskField(
        {@required TextEditingController controller,
        @required TextInputType keyboardType,
        @required String label,
        @required String hintText,
        Widget icon,
        Function onChange,
        int maxLines = 1}) =>
    TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChange,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: kGreyColor, fontWeight: FontWeight.bold),
          labelText: label,
          labelStyle: const TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold),
          suffixIcon: icon,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

Widget defaultText(
        {@required String text,
        double fontSize = 20,
        FontWeight fontWeight = FontWeight.normal,
        Color color = Colors.white}) =>
    Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool search;
  CustomAppBar({
    @required this.title,
    this.search = false,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeLayout()),
                    (route) => false);
              },
              child: Image.asset("assets/images/Group 1558.png"),
            ),
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  "assets/images/Icon.png",
                  height: 30,
                ),
                onPressed: () {
                  navigateTo(context, AllNotificationScreen());
                },
              ),
              IconButton(
                icon: Image.asset(
                  "assets/images/Mask Group 31.png",
                ),
                onPressed: () {},
              ),
            ],
          ),
          // if (search == true)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     child: Row(
          //       children: [
          //         Expanded(
          //             child: TextField(
          //           controller: controller,
          //           decoration: InputDecoration(
          //             isDense: true,
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(10),
          //               borderSide: BorderSide.none,
          //             ),
          //             hintText: "Search",
          //             filled: true,
          //             fillColor: Colors.white,
          //             hintStyle: const TextStyle(
          //                 color: Color(0xffC8C8C8), fontSize: 11),
          //           ),
          //           toolbarOptions: ToolbarOptions(),
          //         )),
          //         SizedBox(
          //           width: 4,
          //         ),
          //         Container(
          //             height: 50,
          //             width: 50,
          //             decoration: const BoxDecoration(
          //                 image: DecorationImage(
          //                     image:
          //                         AssetImage("assets/images/Group 1890.png")))),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(search == true ? 120 : 60);
}

Widget buildProjectCard(context, Widget page) => InkWell(
      onTap: () {
        navigateTo(context, page);
      },
      child: Container(
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
                  height: 22.0,
                  width: double.infinity,
                  color: Colors.yellow,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  width: 25.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      Center(child: defaultText(text: "Design", fontSize: 15)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          text: "New building project",
                          color: kRedColor,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          defaultText(
                              text: "start Date :  ",
                              color: kTitleColor,
                              fontSize: 13),
                          defaultText(
                              text: "2-2-2021", color: kGreyColor, fontSize: 13)
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          defaultText(
                              text: "Deadline :    ",
                              color: kTitleColor,
                              fontSize: 13),
                          defaultText(
                              text: "2-2-2021", color: kGreyColor, fontSize: 13)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.0,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      defaultText(
                          text: "Completed",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kGreenColor)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
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

Widget buildRowForChart(String text, Color color, int number) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3.0,
          height: 3.0,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(
          width: 2.0,
        ),
        defaultText(
            text: text,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16),
        SizedBox(
          width: 2.0,
        ),
        defaultText(text: "$number", color: Colors.grey, fontSize: 16)
      ],
    );

Widget buildProjectTasksCard() => Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(15), topEnd: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 1.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(
                            text: "6 june 2021 - - - - - 16 june 2021",
                            color: kTitleColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.0,
                        ),
                        defaultText(
                            text: "Task :  NewTask -1",
                            color: kGreyColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.0,
                        ),
                        defaultText(
                            text: "Task Admin :   Khaled Ali",
                            color: kGreyColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.0,
                        ),
                        defaultText(
                            text: "Assigned To",
                            color: kGreyColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.0,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 9.0,
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        defaultText(
                            text: "Completed",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: kGreenColor)
                      ],
                    ),
                    SizedBox(
                      width: 1.0,
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: kGreyColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  height: 1,
                  color: kGreyColor,
                ),
                SizedBox(
                  height: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultText(
                          text: "More detailed",
                          color: kTitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      const Text(
                        "Add Note",
                        style: TextStyle(
                            color: kGreenColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 3.0,
          height: 9.0,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20))),
        ),
      ],
    );

///////////////////////////////////////////////
// ignore: must_be_immutable
class CustomAppBarTab extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool search;
  CustomAppBarTab({
    @required this.title,
    this.search = false,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: Expanded(
          child: Column(
            children: [
              AppBar(
                backgroundColor: kPrimaryColor,
                elevation: 0,
                centerTitle: true,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/Group 1558.png")),
                title: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
                actions: [
                  IconButton(
                    icon: Image.asset(
                      "assets/images/Icon.png",
                      height: 30,
                    ),
                    onPressed: () {
                      // navigateTo(context, const AllNotificationScreen());
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/Mask Group 31.png",
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              if (search == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(
                              color: Color(0xffC8C8C8), fontSize: 11),
                        ),
                        toolbarOptions: ToolbarOptions(),
                      )),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Group 1890.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Center(
                            child: Text(
                          "Details",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(search == true ? 120 : 85);
}

Widget buildProjectCardTab(context, Widget page) => InkWell(
      onTap: () {
        navigateTo(context, page);
      },
      child: Container(
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
                  height: 22.0,
                  width: double.infinity,
                  color: Colors.yellow,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  width: 25.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      Center(child: defaultText(text: "Design", fontSize: 15)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          text: "New building project",
                          color: kRedColor,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          defaultText(
                              text: "start Date :  ",
                              color: kTitleColor,
                              fontSize: 13),
                          defaultText(
                              text: "2-2-2021", color: kGreyColor, fontSize: 13)
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          defaultText(
                              text: "Deadline :    ",
                              color: kTitleColor,
                              fontSize: 13),
                          defaultText(
                              text: "2-2-2021", color: kGreyColor, fontSize: 13)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.0,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      defaultText(
                          text: "Completed",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: kGreenColor)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

//////////////////////////////////////////////////////////////////////////////
// ignore: must_be_immutable
class CustomAppBar3 extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool search;
  CustomAppBar3({
    @required this.title,
    this.search = false,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/Group 1558.png"),
            ),
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            actions: [
              // IconButton(
              //   icon: Image.asset(
              //     "assets/images/Icon.png",
              //     height: 30,
              //   ),
              // onPressed: () {
              // navigateTo(context, const AllNotificationScreen());
              //},
              // ),
              // IconButton(
              //   icon: Image.asset(
              //     "assets/images/Mask Group 31.png",
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
          if (search == true)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(
                          color: Color(0xffC8C8C8), fontSize: 11),
                    ),
                    toolbarOptions: ToolbarOptions(),
                  )),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/Group 1890.png")))),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(search == true ? 120 : 60);
}

Widget customTextField({
  @required TextEditingController controller,
  TextInputType keyboardType,
  @required String label,
  @required String hintText,
  int maxLines = 1,
  IconData suffix,
  Function suffixFunction,
  bool showLabel = true,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            floatingLabelBehavior: showLabel
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.never,
            suffixIcon: InkWell(onTap: suffixFunction, child: Icon(suffix)),
            hintText: hintText,
            hintStyle:
                const TextStyle(color: kGreyColor, fontWeight: FontWeight.bold),
            labelText: label,
            labelStyle: const TextStyle(
                color: kPrimaryColor, fontWeight: FontWeight.bold),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          )),
    );

PreferredSizeWidget mycustomAppbar(
    {bool canpop = false,
    BuildContext context,
    double toolbarHeight = 100.0,
    bool havebell = true,
    bool search = false,
    TextEditingController controller,
    bool haveNotf = false,
    String title}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(15),
              bottomEnd: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                canpop
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/Group 1558.png"))
                    : SizedBox(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    if (havebell)
                      Container(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, AllNotificationScreen());
                          },
                          child: Center(
                            child: Stack(
                              children: [
                                Icon(
                                  Elusive.bell,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                if (haveNotf)
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: new BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                        //color: Colors.indigo,
                      ),
                    Image.asset(
                      "assets/images/Mask Group 31.png",
                      height: 50,
                      width: 50,
                    )
                  ],
                )
              ],
            ),
            if (search == true)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 6.5,
                      child: defaultFormField(
                          controller: controller ?? TextEditingController(),
                          hintText: "Search",
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Container(
                              height: 2,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          validate: () {},
                          type: TextInputType.text),
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Container(
                      height: 6.5,
                      width: 13,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/Group 1890.png")))),
                ],
              ),
          ],
        ),
      ),
    ),
  );
}

Widget customrow({String title, String val}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          val,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      )
    ],
  );
}
