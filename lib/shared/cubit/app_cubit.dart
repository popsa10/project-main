import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/getSharedPrefrences.dart';
import 'package:project/model/AllAttendanceModel.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/model/Profile.dart';
import 'package:project/model/all_bounce.dart';
import 'package:project/model/all_detuction.dart';
import 'package:project/model/location/all_location_model.dart';
import 'package:project/model/search_Payrll.dart';
import 'package:project/model/vehicle/add_maintenance_model.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/model/notifications/all_notifications_model.dart';
import 'package:project/model/vacation/all_vacation_model.dart';
import 'package:project/model/vacation/paid_vacation_model.dart';
import 'package:project/model/vehicle/all_maintenance-model.dart';
import 'package:project/model/vehicle/vehicle_model.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/networks/remote/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:project/shared/cubit/app_states.dart';
import 'package:project/view/Menu/MenuHome.dart';
import 'package:project/view/attendence/attendence_screen.dart';
import 'package:project/view/login_main/home_screen_manger.dart';
import 'package:project/view/login_main/home_screen_supervisor.dart';
import 'package:project/view/project/all_projects.dart';
import 'package:project/view/vocation/vacations.dart';
import 'package:project/view/workflow/workflow_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();

  int currentIndex = 2;
  void changeNavBar(int value) {
    currentIndex = value;
    emit(ChangeNavBarState());
  }

  List<Widget> screens = [
    WorkflowScreen(),
    AttendenceScreen(),
    getSharedPrefrences("type") == "manager"
        ? HomeScreen()
        : HomeScreenSupervisor(),
    ProjectsScreen(),
    MenuScreen(),
  ];

  searchPayroll(int user, month) {
    dio
        .get("https://active4web.com/ECC/api/Search-Payroll/{$user}/{$month}")
        .then((value) {
      print(value.toString());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void deleteNotification(notificationId) {
    dio
        .get(
            "https://active4web.com/ECC/api/Delete-Notifications/$notificationId")
        .then((value) {
      print(value.toString());
      getAllNotification();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void createNewTask(
      {String name,
      users,
      String startDate,
      String endDate,
      String ProjectId,
      String description}) {
    DioHelper.postData(url: "Add-Task", data: {
      "name": name,
      "users": users,
      "start_date": startDate,
      "end_date": endDate,
      "desription": description,
      "project_id": ProjectId
    }).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllProjects();
      emit(CreateNewTaskSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewTaskErrorState());
    });
  }

  void editTask(
      {String name,
      users,
      String startDate,
      String endDate,
      String task_id,
      String description}) {
    DioHelper.postData(url: "Edit-Task", data: {
      "name": name,
      "users": users,
      "start_date": startDate,
      "end_date": endDate,
      "desription": description,
      "task_id": task_id
    }).then((value) {
      print("edit :- ${value.data}");
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllProjects();
      emit(CreateNewTaskSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewTaskErrorState());
    });
  }

  Future<List> addProject({
    @required name,
    @required type,
    @required start_date,
    @required end_date,
    @required deadline,
    @required location_id,
    @required schedual_link,
    @required contract_link,
    @required task_creator,
    @required employees,
    @required vehicles,
    @required photo,
    @required notes,
    @required value,
    @required invoices_no,
  }) async {
    var request = new http.MultipartRequest(
        "POST", Uri.parse("https://active4web.com/ECC/api/Add-Project"));
    var multipartFileSign =
        await http.MultipartFile.fromPath("photo", photo.path);
    request.files.add(multipartFileSign);
    request.fields['name'] = "ahmed";
    request.fields['type'] = "type";
    request.fields['start_date'] = start_date;
    request.fields['end_date'] = end_date;
    request.fields['location_id'] = location_id;
    request.fields['schedual_link'] = schedual_link;
    // request.fields['schedual_link'] = schedual_link;
    request.fields['contract_link'] = contract_link;
    request.fields['task_creator'] = task_creator;
    request.fields['employees'] = employees;
    request.fields['deadline'] = deadline;
    // request.fields['contract_link'] = contract_link;
    request.fields['user_id'] = userId.toString();
    request.fields['vehicles'] = vehicles;
    request.fields['notes'] = notes;
    request.fields['value'] = value;
    request.fields['invoices_no'] = invoices_no;
    var response = await request.send();
    Stream<String> r = response.stream.transform(utf8.decoder);
    Map mapResponse;
    await r.listen((event) async {
      print("oooooppppppooooo$event");
      mapResponse = json.decode(event);
      // print("ooooooo$mapResponse");
      // return mapResponse;
    });

    return [mapResponse['status'], mapResponse['msg']];
    // FormData formData = FormData.fromMap({
    //   "name": name,
    //   "type": type,
    //   "start_date": start_date,
    //   "end_date": end_date,
    //   "deadline": deadline,
    //   "location_id": location_id,
    //   "schedual_link": schedual_link,
    //   "contract_link": contract_link,
    //   "task_creator": task_creator,
    //   "employees": employees,
    //   "user_id": userId,
    //   "vehicles": vehicles,
    //   "notes": notes,
    //   "photo":  photo!=null? await MultipartFile.fromFile(photo.path, filename: photo.path.split('/').last):"",
    //   "value": value,
    //   "invoices_no": invoices_no,
    // });
    // DioHelper.postData(url: "Add-Project", token: token, data: formData)
    //     .then((value) {
    //   print(value.data);
    //   getAllProjects();
    // }).catchError((error) {
    //   print(error.toString());
    // });
  }

  AllVehicleModel allVehicles;
  getAllVehicles() {
    emit(GetAllVehiclesLoadingState());
    return DioHelper.getData(
      url: "All-Vehicles",
    ).then((value) {
      allVehicles = AllVehicleModel.fromJson(value.data);
      print(value.data);
      emit(GetAllVehiclesSuccessState());
    }).catchError((error) {
      emit(GetAllVehiclesErrorState());
    });
  }

  Future<List> addVehicle(
      {@required name,
      @required number,
      @required model,
      @required kilometer,
      @required insuranceDateStart,
      @required insuranceDateEnd,
      @required licenseNumber,
      @required driverLicense,
      @required licenseDateEnd,
      @required examinationDate,
      @required userId,
      @required locations,
      @required notes,
      @required carPhoto,
      @required insurancePhoto,
      @required licensePhoto,
      @required status}) async {
    Map data;
    print("insuranceDateStart = ${insuranceDateStart}");
    print("examinationDate = ${examinationDate}");
    print("licenseDateEnd = ${licenseDateEnd}");
    print("insuranceDateEnd = ${insuranceDateEnd}");
    print("name == $name");
    print("number == $number");
    print("model == $model");
    print("kilometer == $kilometer");
    print("licenseNumber == $licenseNumber");
    print("driverLicense == $driverLicense");
    print("userId == $userId");
    print("locations == $locations");
    print("notes == $locations");
    print("status == $status");

    FormData formData = FormData.fromMap({
      "name": name,
      "number": number,
      "model": model,
      "kilometer": kilometer,
      "insurance_date_start": insuranceDateStart,
      "insurance_date_end": insuranceDateEnd,
      "license_number": licenseNumber,
      "driver_license": driverLicense,
      "license_date_end": licenseDateEnd,
      "examination_date": examinationDate,
      "user_id": userId,
      "locations": locations,
      "notes": notes,
      "car_photo": carPhoto != null
          ? await MultipartFile.fromFile(carPhoto.path,
              filename: carPhoto.path.split('/').last)
          : "",
      "insurance_photo": insurancePhoto != null
          ? await MultipartFile.fromFile(insurancePhoto.path,
              filename: insurancePhoto.path.split('/').last)
          : "",
      "license_photo": licensePhoto != null
          ? await MultipartFile.fromFile(licensePhoto.path,
              filename: licensePhoto.path.split('/').last)
          : "",
      "status": status,
    });

    await DioHelper.postData(url: "Add-Vehicles", token: token, data: formData)
        .then((value) {
      print(value.data);
      data = value.data;
    }).catchError((error) {
      print(error.toString());
    });
    return [data['status'], data['msg']];
  }

  Future<List> editVehicle(
      {@required id,
      @required name,
      @required number,
      @required model,
      @required kilometer,
      @required insuranceDateStart,
      @required insuranceDateEnd,
      @required licenseNumber,
      @required driverLicense,
      @required licenseDateEnd,
      @required examinationDate,
      @required userId,
      @required locations,
      @required notes,
      @required carPhoto,
      @required insurancePhoto,
      @required licensePhoto,
      @required status}) async {
    Map data;
    print("insuranceDateStart = ${insuranceDateStart}");
    print("examinationDate = ${examinationDate}");
    print("licenseDateEnd = ${licenseDateEnd}");
    print("insuranceDateEnd = ${insuranceDateEnd}");
    print("name == $name");
    print("number == $number");
    print("model == $model");
    print("kilometer == $kilometer");
    print("licenseNumber == $licenseNumber");
    print("driverLicense == $driverLicense");
    print("userId == $userId");
    print("locations == $locations");
    print("notes == $locations");
    print("status == $status");

    FormData formData = FormData.fromMap({
      "name": name,
      "number": number,
      "vehicle_id": id,
      "model": model,
      "kilometer": kilometer,
      "insurance_date_start": insuranceDateStart,
      "insurance_date_end": insuranceDateEnd,
      "license_number": licenseNumber,
      "driver_license": driverLicense,
      "license_date_end": licenseDateEnd,
      "examination_date": examinationDate,
      "user_id": userId,
      "locations": locations,
      "notes": notes,
      "car_photo": carPhoto != null
          ? await MultipartFile.fromFile(carPhoto.path,
              filename: carPhoto.path.split('/').last)
          : "",
      "insurance_photo": insurancePhoto != null
          ? await MultipartFile.fromFile(insurancePhoto.path,
              filename: insurancePhoto.path.split('/').last)
          : "",
      "license_photo": licensePhoto != null
          ? await MultipartFile.fromFile(licensePhoto.path,
              filename: licensePhoto.path.split('/').last)
          : "",
      "status": status,
    });

    await DioHelper.postData(url: "Edit-Vehicles", token: token, data: formData)
        .then((value) {
      print(value.data);
      data = value.data;
    }).catchError((error) {
      print(error.toString());
    });
    return [data['status'], data['msg']];
  }

  void deleteVehicle(vehicleId) {
    DioHelper.getData(url: "Delete-Vehicles/${vehicleId}").then((value) {
      print(value.toString());
      getAllVehicles();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AllProjectModel allProject;
  getAllProjects() {
    emit(GetAllProjectLoadingState());
    DioHelper.getData(url: "All-Project").then((value) {
      allProject = AllProjectModel.fromJson(value.data);
      emit(GetAllProjectSuccessState());
    });
    //     .catchError((error) {
    //   print(error.toString());
    //   emit(GetAllProjectErrorState());
    // });
  }

  AllMaintenanceModel maintenanceModel;
  void getAllMaintenance(vehicleId, userId) {
    emit(GetAllMaintenanceLoadingState());
    DioHelper.getData(url: "all-Maintaincess/$vehicleId/$userId").then((value) {
      maintenanceModel = AllMaintenanceModel.fromJson(value.data);
      emit(GetAllMaintenanceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllMaintenanceErrorState());
    });
  }

  void deleteTask(taskId) {
    DioHelper.getData(url: "Delete-Task/${taskId}").then((value) {
      print(value.data);
      getAllProjects();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AddMaintenanceModel addMaintenanceModel;
  void addMaintenance({
    description,
    userId,
    vehicleId,
    date,
  }) {
    DioHelper.postData(url: "add-Maintaincess", data: {
      "decription": description,
      "user_id": userId,
      "vichel_id": vehicleId,
      "date": date,
    }).then((value) {
      addMaintenanceModel = AddMaintenanceModel.fromJson(value.data);
      getAllMaintenance(vehicleId, userId);
      emit(AddMaintenanceSuccessState(addMaintenanceModel));
    }).catchError((error) {
      print(error.toString());
      emit(AddMaintenanceErrorState());
    });
  }

  VacationModel vacationModel;
  void getAllVacations() {
    emit(GetAllVehiclesLoadingState());
    DioHelper.getData(url: "All-Vacation").then((value) {
      vacationModel = VacationModel.fromJson(value.data);
      emit(GetAllVehiclesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllVehiclesErrorState());
    });
  }

  PaidVacationModel paidVacationModel;
  void getPaidVacation() {
    emit(GetPaidVacationLoadingState());
    DioHelper.getData(url: "Paid-Vacation").then((value) {
      paidVacationModel = PaidVacationModel.fromJson(value.data);
      emit(GetPaidVacationSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPaidVacationErrorState());
    });
  }

  void acceptVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Accept-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      getAllVacations();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void cancelVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Cancel-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      getAllVacations();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AllNotificationModel allNotificationModel;
  void getAllNotification() {
    DioHelper.getData(url: "All-notifications").then((value) {
      allNotificationModel = AllNotificationModel.fromJson(value.data);
      emit(GetAllNotificationSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllNotificationErrorState());
    });
  }

  Future sendNote(String notes, String employee) {
    return DioHelper.postData(
        url: "Send-notifications",
        data: {"notes": notes, "employee": employee}).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<AllEmployeesModel> getEmployees() async {
    AllEmployeesModel allEmployees;
    emit(GetAllEmployeesLoadingState());
    Response response = await DioHelper.postData(
        url: "All-Emploes/${await getSharedPrefrences("ownerId")}",
        token: token,
        data: {
          "user_id": await getSharedPrefrences("id"),
          "company_id": await getSharedPrefrences("comId")
        });
    print("uuuuuuuuuu${response.data}");
    allEmployees = AllEmployeesModel.fromJson(response.data);
    print(allEmployees);
    return allEmployees;
  }

  Future<AllLocationsModel> getLocations() async {
    AllLocationsModel allLocations;
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.getData(
      url: "All-Location",
      token: token,
    );
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    allLocations = AllLocationsModel.fromJson(response.data);
    print("uuuuuuuuu${allLocations.msg}");
    return allLocations;
  }

  Future<bool> AddLocations(Map formData) async {
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.postData(
        url: "Add-Location", token: token, data: formData);
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    return response.data['status'];
  }

  Future<bool> EditLocations(Map formData) async {
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.postData(
        url: "Edit-Location", token: token, data: formData);
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    return response.data['status'];
  }

  Future<bool> DeleteLocation(id) async {
    emit(GetAllEmployeesLoadingState());
    Response response =
        await DioHelper.getData(url: "Delete-Location/$id", token: token);
    print(response.data);
    return response.data['status'];
  }

  Future<bool> AllDetection() async {
    emit(GetAllEmployeesLoadingState());
    Response response =
        await DioHelper.getData(url: "All-Detuction", token: token);
    print(response.data);
    return response.data['status'];
  }

  Future<AllReports> getAllReports() async {
    AllReports allReports;
    emit(GetAllEmployeesLoadingState());
    Response response =
        await DioHelper.getData(url: "All-Reports", token: token);
    print(response.data);
    allReports = AllReports.fromJson(response.data);
    return allReports;
  }

  Future<AllProjectModel> getProjects() async {
    AllProjectModel allProject;
    emit(GetAllProjectLoadingState());
    Response response = await DioHelper.getData(url: "All-Project");

    allProject = AllProjectModel.fromJson(response.data);
    print("eeeeeeeee$allProject");

    emit(GetAllProjectSuccessState());
    return allProject;
    //     .catchError((error) {
    //   print(error.toString());
    //   emit(GetAllProjectErrorState());
    // });
  }

  Future<bool> AcceptReport(reportId, userId) async {
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.postData(
        url: "Accept-Reports",
        token: token,
        data: {"report_id": reportId, "user_id": userId});
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    return response.data['status'];
  }

  Future<bool> DeleteReport(reportId, userId) async {
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.postData(
        url: "Cancel-Reports",
        token: token,
        data: {"report_id": reportId, "user_id": userId});
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    return response.data['status'];
  }

  Future<bool> SendNote(note, userId) async {
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.postData(
        url: "Send-notifications",
        token: token,
        data: {"notes": note, "employee": userId});
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    return response.data['status'];
  }

  Future<AllAtendanceModel> getAllAttendance(date) async {
    AllAtendanceModel allAtendanceModel;
    emit(GetAllEmployeesLoadingState());
    Response response =
        await DioHelper.getData(url: "All-Attend/$date", token: token);
    print(response.data);
    allAtendanceModel = AllAtendanceModel.fromJson(response.data);
    return allAtendanceModel;
  }

  Future createVacation(
      {String type, String name, int employee, startDate, reason, endDate}) {
    print("dcdcfkkkkk$userId");
    return DioHelper.postData(url: "Add-Vacation", data: {
      "type": type,
      "user_id": "1",
      "name": name,
      "employee": employee.toString(),
      "start_date": startDate,
      "reason": reason,
      "end_date": endDate,
    }).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllVacations();
    }).catchError((error) {
      print(error.toString());
    });
  }

  // payroll
  AllBounce allBounce;
  getAllBounce() {
    dio.get("https://active4web.com/ECC/api/All-Payroll").then((value) {
      print(value.data);
      allBounce = AllBounce.fromJson(value.data);
    });
  }

  Future<void> paidBounce({int bounceId, int submitUserId}) async {
    print(bounceId);
    print(submitUserId);
    await DioHelper.postData(url: "Paid-Bounce", data: {
      "bounce_id": bounceId.toString(),
      "submituser_id": await getSharedPrefrences("id"),
      "user_id": await getSharedPrefrences("id"),
    }).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllBounce();
    });
  }

  void addBounce({employess, String userId, amount, reason, date}) {
    DioHelper.postData(url: "Add-Bounce", data: {
      "employess": employess,
      "user_id": userId,
      "amount": amount,
      "reason": reason,
      "date": date,
    }).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllBounce();
    });
  }

  AllBounce allDetuctions;
  void getAllDetuction() {
    DioHelper.getData(url: "All-Payroll").then((value) {
      print("kjbjbhjbjhkbkj");
      allDetuctions = AllBounce.fromJson(value.data);
      print(value.data);
    });
  }

  void addDetuction({employess, String userId, amount, reason, date}) {
    DioHelper.postData(url: "Add-Detuction", data: {
      "employess": employess,
      "user_id": userId,
      "amount": amount,
      "reason": reason,
      "date": date,
    }).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllDetuction();
    }).catchError((error) {
      print(error.toString());
    });
  }

  deleteDetuction(bounceId) {
    DioHelper.getData(url: "Delete-Bounce_OR_Detuction/$bounceId")
        .then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      getAllDetuction();
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<void> addPermissions({userid, permission}) async {
    DioHelper.postData(url: "Add-Permission", data: {
      "userid": userid,
      "permission": permission.join(","),
    }).then((value) {
      print("permissions :- ${value.data}");
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<void> checkIn({userid, location, date, time}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DioHelper.postData(url: "Add-Attend", data: {
      "user_id": userid,
      "location_id": location,
      "date": date,
      "time": time
    }).then((value) {
      print(" ${value.data}");
      if (value.data['status']) {
        print("tmaaaaaaam");
        preferences.setString("checkTime", null);
        preferences.setString("checkDate", null);
        Fluttertoast.showToast(
            msg: value.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<void> checkOut({userid, location, date, time}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    DioHelper.postData(url: "Attend-Logout", data: {
      "user_id": userid,
      "location_id": location,
      "date": date,
      "time": time,
    }).then((value) {
      print(" ${value.data}");
      if (value.data['status']) {
        print("تممممممم");
        preferences.setString("checkTime", null);
        preferences.setString("checkDate", null);
        Fluttertoast.showToast(
            msg: value.data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<Profile> getProfile() async {
    Profile allProject;
    emit(GetAllProjectLoadingState());
    Response response = await DioHelper.getData(
        url: "Get-Profile/${await getSharedPrefrences("id")}");

    allProject = Profile.fromJson(response.data);
    print("eeeeeeeee$allProject");

    emit(GetAllProjectSuccessState());
    return allProject;
  }
}
