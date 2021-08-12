// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/model/all_bounce.dart';
// import 'package:project/shared/components.dart';
// import 'package:project/shared/cubit/app_cubit.dart';
// import 'package:project/shared/cubit/app_states.dart';
// import 'package:project/view/payroll/payroll%20_sheet_1.dart';
// import '../../constants.dart';
//
// class Payroll_Screen extends StatelessWidget {
//   Payroll_Screen({Key key}) : super(key: key);
//   final employeeId = TextEditingController();
//   String month;
//   String employeeName;
//
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Payroll'),
//           centerTitle: true,
//           backgroundColor: kPrimaryColor,
//           elevation: 0,
//           leading: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Image.asset("assets/images/Group 1558.png")),
//         ),
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               height: _size.height * 0.342,
//               decoration: BoxDecoration(
//                 color: kPrimaryColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                           child: customTextField(
//                               controller: employeeId,
//                               label: "Employee Id",
//                               hintText: "Employee Id")),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                           child: customDropdownMenu(
//                               label: "Employee Name",
//                               value: month,
//                               hintText: "Select Month")),
//                     ],
//                   ),
//                   customDropdownMenu(
//                       hintText: "Choose from emploees",
//                       label: "Employee Name",
//                       value: employeeName),
//                   defaultButton(
//                     text: "Search",
//                     height: 50,
//                     onPressed: () {},
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             BlocConsumer<AppCubit, AppStates>(
//                 listener: (context, state) {},
//                 // bloc: AppCubit.get(context)..getAllBounce(),
//                 builder: (context, state) {
//                   AllBounce cubit = AppCubit.get(context).allBounce;
//                   return cubit != null
//                       ? Expanded(
//                           child: ListView.separated(
//                               itemBuilder: (context, index) => itemList(
//                                   context: context,
//                                   index: index,
//                                   model: cubit.bounces[index]),
//                               separatorBuilder: (context, index) => SizedBox(
//                                     height: 10,
//                                   ),
//                               itemCount: cubit.bounces.length),
//                         )
//                       : Center(
//                           child: CircularProgressIndicator(),
//                         );
//                 })
//           ],
//         ));
//   }
//
//   Widget itemList({@required BuildContext context, Bounce model, int index}) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10), color: Colors.white),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Emloyee ID",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "1",
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Employee Name",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "mohammed",
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Month",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "April",
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Payroll",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "${model.amount} SAR",
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Status",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     model.status,
//                     style:
//                         TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//                   ),
//                 )
//               ],
//             ),
//             Divider(
//               height: 2,
//               color: Colors.grey,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     navigateTo(
//                         context,
//                         Payroll_Sheet_1(
//                           model: model,
//                         ));
//                   },
//                   child: Text(
//                     'More details',
//                     style: TextStyle(color: Colors.indigo, fontSize: 16),
//                   ),
//                 ),
//                 if (model.status == "unpaid")
//                   TextButton(
//                     onPressed: () {
//                       AppCubit.get(context).paidBounce(
//                           bounceId: model.id, submitUserId: model.submituserId);
//                     },
//                     child: Text(
//                       'Paid',
//                       style: TextStyle(
//                           color: kGreenColor,
//                           fontSize: 16,
//                           decoration: TextDecoration.underline),
//                     ),
//                   ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
