import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/constants.dart';
import 'package:project/view/layout/home_layout.dart';
import 'package:project/view/login_main/cubit/login_cubit.dart';
import 'package:project/view/login_main/cubit/login_states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/components.dart';
import 'home_screen_supervisor.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GetStorage getStorage = GetStorage();
  LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status) {
            showToast(text: state.loginModel.msg, color: kGreenColor)
                .then((value) async {
              getStorage.write("companyId", state.loginModel.data.companyId);
              getStorage.write("userId", state.loginModel.data.id);
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString("id", state.loginModel.data.id.toString());
              sharedPreferences.setString("jwt", state.loginModel.data.apiToken);
              sharedPreferences.setString("img", state.loginModel.data.photo);
              sharedPreferences.setString("comId", state.loginModel.data.companyId.toString());
              sharedPreferences.setString("ownerId", state.loginModel.data.ownerId.toString());
              sharedPreferences.setString("type", state.loginModel.data.type);
              sharedPreferences.setString("name", state.loginModel.data.name);
              sharedPreferences.setString("phone", state.loginModel.data.phone.toString());
              sharedPreferences.setString("add_employee", state.loginModel.data.permission.addEmployee??"no");
              sharedPreferences.setString("edit_employee", state.loginModel.data.permission.editEmployee);
              sharedPreferences.setString("delete_employee", state.loginModel.data.permission.deleteEmployee);
              sharedPreferences.setString("view_employee", state.loginModel.data.permission.viewEmployee);
              sharedPreferences.setString("add_Projects", state.loginModel.data.permission.addProjects);
              sharedPreferences.setString("edit_Projects", state.loginModel.data.permission.editProjects);
              sharedPreferences.setString("delete_Projects", state.loginModel.data.permission.deleteProjects);
              sharedPreferences.setString("view_Projects", state.loginModel.data.permission.viewProjects);
              sharedPreferences.setString("add_Locations", state.loginModel.data.permission.addLocations);
              sharedPreferences.setString("edit_Locations", state.loginModel.data.permission.editLocations);
              sharedPreferences.setString("delete_Locations", state.loginModel.data.permission.deleteLocations);
              sharedPreferences.setString("view_Locations", state.loginModel.data.permission.viewLocations);
              sharedPreferences.setString("add_vehicle", state.loginModel.data.permission.addVehicle);
              sharedPreferences.setString("edit_vehicle", state.loginModel.data.permission.editVehicle);
              sharedPreferences.setString("delete_vehicle", state.loginModel.data.permission.deleteVehicle);
              sharedPreferences.setString("view_vehicle", state.loginModel.data.permission.viewVehicle);
              sharedPreferences.setString("add_Invoice", state.loginModel.data.permission.addInvoice);
              sharedPreferences.setString("edit_Invoice", state.loginModel.data.permission.editInvoice);
              sharedPreferences.setString("delete_Invoice", state.loginModel.data.permission.deleteInvoice);
              sharedPreferences.setString("view_Invoice", state.loginModel.data.permission.viewInvoice);
              sharedPreferences.setString("paid_Invoice", state.loginModel.data.permission.paidInvoice);
              sharedPreferences.setString("unpaid_Invoice", state.loginModel.data.permission.unpaidInvoice);
              sharedPreferences.setString("approval_payroll", state.loginModel.data.permission.approvalPayroll);
              sharedPreferences.setString("paid_payroll", state.loginModel.data.permission.paidPayroll);
              sharedPreferences.setString("unpaid_payroll", state.loginModel.data.permission.unpaidPayroll);
              sharedPreferences.setString("edit_vacations", state.loginModel.data.permission.editVacations);
              sharedPreferences.setString("add_vacations", state.loginModel.data.permission.editVacations);
              sharedPreferences.setString("view_vacations", state.loginModel.data.permission.viewVacations);
              sharedPreferences.setString("delete_vacations", state.loginModel.data.permission.deleteVacations);
              sharedPreferences.setString("approval_vacations", state.loginModel.data.permission.approvalVacations);
              sharedPreferences.setString("reject_vacations", state.loginModel.data.permission.rejectVacations);
              sharedPreferences.setString("add_task", state.loginModel.data.permission.addTask);
              sharedPreferences.setString("edit_task", state.loginModel.data.permission.editTask);
              sharedPreferences.setString("view_task", state.loginModel.data.permission.viewTask);
              sharedPreferences.setString("delete_task", state.loginModel.data.permission.deleteTask);
              sharedPreferences.setString("add_reports", state.loginModel.data.permission.addReports);
              sharedPreferences.setString("edit_reports", state.loginModel.data.permission.editReports);
              sharedPreferences.setString("view_reports", state.loginModel.data.permission.viewReports);
              sharedPreferences.setString("delete_reports", state.loginModel.data.permission.deleteReports);
              sharedPreferences.setString("approve_reports", state.loginModel.data.permission.approveReports);
              sharedPreferences.setString("addnote_reports", state.loginModel.data.permission.addnoteReports);
              sharedPreferences.setString("add_attendance", state.loginModel.data.permission.addAttendance);
              sharedPreferences.setString("edit_attendance", state.loginModel.data.permission.editAttendance);
              sharedPreferences.setString("delete_attendance", state.loginModel.data.permission.deleteAttendance);
              sharedPreferences.setString("view_attendance", state.loginModel.data.permission.viewAttendance);
              sharedPreferences.setString("approve_attendance", state.loginModel.data.permission.approveAttendance);
              sharedPreferences.setString("add_customerlist", state.loginModel.data.permission.addCustomerlist);
              sharedPreferences.setString("edit_customerlist", state.loginModel.data.permission.editCustomerlist);
              sharedPreferences.setString("delete_customerlist", state.loginModel.data.permission.deleteCustomerlist);
              sharedPreferences.setString("view_customerlist", state.loginModel.data.permission.viewCustomerlist);
              sharedPreferences.setString("addreport_customerlist", state.loginModel.data.permission.addreportCustomerlist);
              sharedPreferences.setString("add_supplierlist", state.loginModel.data.permission.addSupplierlist);
              sharedPreferences.setString("edit_supplierlist", state.loginModel.data.permission.editSupplierlist);
              sharedPreferences.setString("delete_supplierlist", state.loginModel.data.permission.deleteSupplierlist);
              sharedPreferences.setString("view_supplierlist", state.loginModel.data.permission.viewSupplierlist);
              sharedPreferences.setString("addreport_supplierlist", state.loginModel.data.permission.addreportSupplierlist);

              getStorage
                  .write("token", state.loginModel.data.apiToken)
                  .then((value) {
                navigateToAndFinish(context, HomeLayout());
              });
            });
          }
          showToast(text: state.loginModel.msg, color: kRedColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kSecondaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    width: size.width * 0.6,
                    height: size.height * 0.5,
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: defaultText(
                      text: "ECC staff login",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 23)),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(30),
                      topEnd: Radius.circular(30),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          text: "User Name",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      customTextFormField(
                          hintText: "User Name",
                          controller: phoneController,
                          suffix: Image.asset("assets/images/user.png",
                              color: Color(0xffDFDFDF)),
                          type: TextInputType.text,
                          isPassword: false),
                      const SizedBox(
                        height: 27,
                      ),
                      defaultText(
                          text: "Password",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      customTextFormField(
                          hintText: "Password",
                          controller: passwordController,
                          suffix: Icon(
                            AppLoginCubit.get(context).suffix,
                            color: Color(0xffDFDFDF),
                          ),
                          suffixFunction: () {
                            AppLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: AppLoginCubit.get(context).isPassword),
                      const SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                            text: "Login",
                            onPressed: () {
                              AppLoginCubit.get(context).userLogin(
                                phoneController.text,
                                passwordController.text,
                              );
                            },
                            color: Color(0xfff2503e)),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
