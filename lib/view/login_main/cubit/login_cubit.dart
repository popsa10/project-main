import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/model/login_model.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_states.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(InitialLoginState());
  static AppLoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel;
  Future<void> userLogin(String phone, String password) async {
    emit(LoginLoadingState());
    FirebaseMessaging.instance.getToken().then((value) {
      DioHelper.postData(
              url: "login",
              data: {"name": phone, "password": password, "fb_token": value})
          .then((value) {
            print(value.data);
        loginModel = LoginModel.fromJson(value.data);
        // sharedPreferences.setString("id", loginModel.data.id.toString());
        // sharedPreferences.setString("jwt", loginModel.data.apiToken);
        // sharedPreferences.setString("img", loginModel.data.photo);
        // sharedPreferences.setString("name", loginModel.data.name);
        // sharedPreferences.setString("phone", loginModel.data.phone.toString());
        // sharedPreferences.setString("add_employee", loginModel.data.permission.addEmployee);
        // sharedPreferences.setString("edit_employee", loginModel.data.permission.editEmployee);
        // sharedPreferences.setString("delete_employee", loginModel.data.permission.deleteEmployee);
        // sharedPreferences.setString("view_employee", loginModel.data.permission.viewEmployee);
        // sharedPreferences.setString("add_Projects", loginModel.data.permission.addProjects);
        // sharedPreferences.setString("edit_Projects", loginModel.data.permission.editProjects);
        // sharedPreferences.setString("delete_Projects", loginModel.data.permission.deleteProjects);
        // sharedPreferences.setString("view_Projects", loginModel.data.permission.viewProjects);
        // sharedPreferences.setString("edit_Locations", loginModel.data.permission.editLocations);
        // sharedPreferences.setString("delete_Locations", loginModel.data.permission.deleteLocations);
        // sharedPreferences.setString("view_Locations", loginModel.data.permission.viewLocations);
        // sharedPreferences.setString("add_vehicle", loginModel.data.permission.addVehicle);
        // sharedPreferences.setString("edit_vehicle", loginModel.data.permission.editVehicle);
        // sharedPreferences.setString("delete_vehicle", loginModel.data.permission.deleteVehicle);
        // sharedPreferences.setString("view_vehicle", loginModel.data.permission.viewVehicle);
        // sharedPreferences.setString("add_Invoice", loginModel.data.permission.addInvoice);
        // sharedPreferences.setString("edit_Invoice", loginModel.data.permission.editInvoice);
        // sharedPreferences.setString("delete_Invoice", loginModel.data.permission.deleteInvoice);
        // sharedPreferences.setString("view_Invoice", loginModel.data.permission.viewInvoice);
        // sharedPreferences.setString("paid_Invoice", loginModel.data.permission.paidInvoice);
        // sharedPreferences.setString("unpaid_Invoice", loginModel.data.permission.unpaidInvoice);
        // sharedPreferences.setString("approval_payroll", loginModel.data.permission.approvalPayroll);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.paidPayroll);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.unpaidPayroll);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.addBounce);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.editBounce);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.deleteBounce);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.viewBounce);
        // sharedPreferences.setString("paid_payroll", loginModel.data.permission.approvalOvertime);
        // sharedPreferences.setString("add_vacations", loginModel.data.permission.addVacations);
        // sharedPreferences.setString("edit_vacations", loginModel.data.permission.editVacations);
        // sharedPreferences.setString("view_vacations", loginModel.data.permission.viewVacations);
        // sharedPreferences.setString("delete_vacations", loginModel.data.permission.deleteVacations);
        // sharedPreferences.setString("approval_vacations", loginModel.data.permission.approvalVacations);
        // sharedPreferences.setString("reject_vacations", loginModel.data.permission.rejectVacations);
        // sharedPreferences.setString("add_task", loginModel.data.permission.addTask);
        // sharedPreferences.setString("edit_task", loginModel.data.permission.editTask);
        // sharedPreferences.setString("view_task", loginModel.data.permission.viewTask);
        // sharedPreferences.setString("delete_task", loginModel.data.permission.deleteTask);
        // sharedPreferences.setString("add_reports", loginModel.data.permission.addReports);
        // sharedPreferences.setString("edit_reports", loginModel.data.permission.editReports);
        // sharedPreferences.setString("edit_reports", loginModel.data.permission.viewReports);
        // sharedPreferences.setString("delete_reports", loginModel.data.permission.deleteReports);
        // sharedPreferences.setString("approve_reports", loginModel.data.permission.approveReports);
        // sharedPreferences.setString("addnote_reports", loginModel.data.permission.addnoteReports);
        // sharedPreferences.setString("add_attendance", loginModel.data.permission.addAttendance);
        // sharedPreferences.setString("edit_attendance", loginModel.data.permission.editAttendance);
        // sharedPreferences.setString("delete_attendance", loginModel.data.permission.deleteAttendance);
        // sharedPreferences.setString("view_attendance", loginModel.data.permission.viewAttendance);
        // sharedPreferences.setString("approve_attendance", loginModel.data.permission.approveAttendance);
        // sharedPreferences.setString("add_customerlist", loginModel.data.permission.addCustomerlist);
        // sharedPreferences.setString("edit_customerlist", loginModel.data.permission.editCustomerlist);
        // sharedPreferences.setString("delete_customerlist", loginModel.data.permission.deleteCustomerlist);
        // sharedPreferences.setString("view_customerlist", loginModel.data.permission.viewCustomerlist);
        // sharedPreferences.setString("addreport_customerlist", loginModel.data.permission.addreportCustomerlist);
        // sharedPreferences.setString("add_supplierlist", loginModel.data.permission.addSupplierlist);
        // sharedPreferences.setString("edit_supplierlist", loginModel.data.permission.editSupplierlist);
        // sharedPreferences.setString("delete_supplierlist", loginModel.data.permission.deleteSupplierlist);
        // sharedPreferences.setString("view_supplierlist", loginModel.data.permission.viewSupplierlist);
        // sharedPreferences.setString("addreport_supplierlist", loginModel.data.permission.addreportSupplierlist);
        emit(LoginSuccessState(loginModel));
      }).catchError((error) {
        print(error.toString());
        emit(LoginErrorState());
      });
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginPasswordState());
  }
}
