import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/model/AllEmployeeModel.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/model/AllTasksModel.dart';
import 'package:project/model/AllVocationModel.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/model/vehicle/GetAllLocation.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/Employee/Cubit/States.dart';
import 'package:http/http.dart' as http;
import '../../../getSharedPrefrences.dart';

class AppsCubit extends Cubit<AppStates> {
  AppsCubit() : super(AppInitialStates());

  static AppsCubit get(context) => BlocProvider.of(context);

  AllEmployeeModel getAllEmployee;

  void getallEmployee() {
    emit(AppLoadingAllEmployeeStates());
    DioHelper.postData(
            url: "All-Emploes", data: {'user_id': 1, 'company_id': 1})
        .then((value) => {
              getAllEmployee = AllEmployeeModel.fromJson(value.data),
              emit(AppScuessAllEmployeeStates()),
            })
        .catchError((onError) {
      print("Error $onError");
      print("Error ${onError.toString()}");
      emit(AppErrorAllEmployeeStates());
    });
  }

  Future<void> addNewEmployee(Map formData) async {
    var request = new http.MultipartRequest(
        "POST", Uri.parse("https://active4web.com/ECC/api/Add-Employee"));
    if (formData['photo'] != null) {
      var multipartFileSign =
          await http.MultipartFile.fromPath("photo", formData['photo'].path);
      request.files.add(multipartFileSign);
    }
    if (formData['iqamaphoto'] != null) {
      var multipartFileSign2 = await http.MultipartFile.fromPath(
          "iqamaphoto", formData['iqamaphoto'].path);
      request.files.add(multipartFileSign2);
    }
    if (formData['passport_photo'] != null) {
      var multipartFileSign3 = await http.MultipartFile.fromPath(
          "passport_photo", formData['passport_photo'].path);
      request.files.add(multipartFileSign3);
    }
    if (formData['contract_file'] != null) {
      var multipartFileSign4 = await http.MultipartFile.fromPath(
          "contract_file", formData['contract_file'].path);
      request.files.add(multipartFileSign4);
    }
    if (formData['insurance_photo'] != null) {
      var multipartFileSign5 = await http.MultipartFile.fromPath(
          "insurance_photo", formData['insurance_photo'].path);
      request.files.add(multipartFileSign5);
    }
    request.fields['name'] = formData['name'];
    request.fields['others'] = formData['others'];
    request.fields['email'] = formData['email'];
    request.fields['password'] = formData['password'];
    request.fields['phone'] = formData['phone'];
    request.fields['work_dayes'] = formData['work_dayes'];
    request.fields['salary'] = formData['salary'];
    request.fields['work_start'] = formData['work_start'];
    request.fields['work_end'] = formData['work_end'];
    request.fields['iqamaenddate'] = formData['iqamaenddate'];
    request.fields['passportenddate'] = formData['passportenddate'];
    request.fields['joining_date'] = formData['joining_date'];
    request.fields['contract_date'] = formData['contract_date'];
    request.fields['insurance_start_date'] = formData['insurance_start_date'];
    request.fields['insurance_end_date'] = formData['insurance_end_date'];
    request.fields['company_id'] = formData['company_id'];
    request.fields['owner_id'] = formData['owner_id'];
    request.fields['iqama'] = formData['iqama'];
    request.fields['passportnum'] = formData['passportnum'];
    request.fields['employeetype'] = formData['employeetype'];
    request.fields['subemployee'] = formData['subemployee'];
    request.fields['vacationemployee'] = formData['vacationemployee'];
    request.fields['overtimeemployee'] = formData['overtimeemployee'];
    request.fields['reportemployee'] = formData['reportemployee'];
    request.fields['bounceemployee'] = formData['bounceemployee'];
    var response = await request.send();
    Stream<String> r = response.stream.transform(utf8.decoder);
    Map mapResponse;
    await r.listen((event) async {
      print("oooooppppppooooo$event");
      mapResponse = json.decode(event);
      Fluttertoast.showToast(
          msg: mapResponse['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      // print("ooooooo$mapResponse");
      // return mapResponse;
    });

    return [mapResponse['status'], mapResponse['msg']];

    emit(AppLoadingADDEmployeeStates());
    await DioHelper.postData(url: "Add-Employee", data: formData).then((value) {
      emit(AppScuessADDEmployeeStates());
      print("Scuessssssssssssss");
      print(value.toString());
      Fluttertoast.showToast(
          msg: value.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      // getallEmployee();
    }).catchError((onError) {
      emit(AppErrorADDEmployeeStates());
      print("Error $onError");
    });
  }

///////   add tasks /////////////////////////////////////////////////////
  void addTasks(
      {String name,
      String users,
      String startdate,
      String enddate,
      String desription}) {
    DioHelper.postData(url: "Add-Task", data: {
      'name': name,
      'users': users,
      'start_date': startdate,
      'end_date': enddate,
      'desription': desription,
    }).then((value) {
      emit(AppScuessAddTasks());
      print("Scuesss Add Tasks ");
    }).catchError((onError) {
      emit(AppErrorAddTasks());
      print("Error Add Data");
      print("Error ${onError.toString()}");
    });
  }

  //////////////////////////////////////////////////          get allTasks ///////////
  AllTasksModel allTasksModel;
  void getAllTasks() {
    emit(AppLoadingGetAllTasks());
    DioHelper.getData(url: "All-Tasks/1").then((value) {
      allTasksModel = AllTasksModel.fromJson(value.data);
      emit(AppScuessGetAllTasks());
      print(allTasksModel.tasks.toString());
      print("ScuessGetAllTasks");
    }).catchError((onError) {
      emit(AppErrorGetAllTasks());

      print("onError ${onError.toString}");
      print("ErrorGetAllTasks");
    });
  }

///////////////////////////////////////////////////////////////      get AllVacationModel
  AllVacationModel allVacationModel;
  void getAllVacation() {
    emit(AppLoadingAllVacationModel());
    DioHelper.getData(url: "All-Vacation").then((value) {
      allVacationModel = AllVacationModel.fromJson(value.data);
      print(allVacationModel.vacations[0]);
      emit(AppScuessAllVacationModel());
    });
    //     .catchError((onError) {
    //   emit(AppErrorAllVacationModel());
    // });
  }

  void acceptVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Accept-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      getAllVacation();
      print("accept Vactation");
    }).catchError((error) {
      print(error.toString());
      print("Error Vactation");
    });
  }

  void cancelVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Cancel-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      print("Cancel Vactation");
      getAllVacation();
    }).catchError((error) {
      print(error.toString());
      print("Error Cancel");
    });
  }

////////////////////////////////////////////////////////////////////////// get allReports /////
  AllReports allReports;
  void getallReports() {
    emit(AppLoadingAllReports());
    DioHelper.getData(url: "All-Reports").then((value) {
      allReports = AllReports.fromJson(value.data);
      emit(AppScuessAllReports());
      print("Scuess Get All Reports ");
      print(value.toString());
    }).catchError((onError) {
      emit(AppErrorAllReports());
      print("Error Get All Reports ");
      print("${onError.toString()}");
    });
  }

  ///////// accept /////
  void acceptReport(reportid, userid) {
    DioHelper.postData(
        url: "Accept-Reports",
        data: {"report_id": reportid, "user_id": userid}).then((value) {
      emit(AppScuessAllReports());
      getallReports();
      print("Scuess accept  ");
    }).catchError((onError) {
      emit(AppErrorAllReports());
      print("Error accept ");
    });
  }
//////// cancel ///////

  void cancelReport(reportid, userid) {
    DioHelper.postData(
        url: "Cancel-Reports",
        data: {"report_id": reportid, "user_id": userid}).then((value) {
      emit(AppScuessAllReports());
      getallReports();
      print("Scuess Cancel ");
    }).catchError((onError) {
      emit(AppErrorAllReports());
      print("Error Cancel ");
    });
  }

///////////////////////////////////////////////////////// Add-- Report  ///// /
//////////
  void postAddReport(FormData formData) {
    DioHelper.postData(url: "Add-Report", data: formData).then((value) {
      emit(AppScuessPostAddReport());
      print(" Scuess Add Report ");
      print("lllllllll${value.toString()}");
      showToast(text: value.data['msg']);
      getallReports();
    }).catchError((onError) {
      emit(AppErrorPostAddReport());
      print(" Scuess Add Report ");
      print(onError.toString());
    });
  }

  Future<void> addReport({
    locationid,
    userid,
    target,
    kilometer,
    achievements,
    problems,
    file1,
    file2,
    file3,
    file4,
    taskid,
    note,
  }) async {
    print("locationid = $locationid");
    print("userid = $userid");
    print("target = $target");
    print("kilometer = $kilometer");
    print("achievements == $achievements");
    print("problems == $problems");
    print("file1 == $file1");
    print("file2 == $file2");
    print("file3 == $file3");
    print("file4 == $file4");
    print("taskid == $taskid");

    FormData formData = FormData.fromMap({
      "location_id": locationid,
      "user_id": userid,
      "target": target,
      "achievements": achievements,
      "problems": problems,
      "file1": file1 != null
          ? await MultipartFile.fromFile(file1.path,
              filename: file1.path.split('/').last)
          : "",
      "file2": file2 != null
          ? await MultipartFile.fromFile(file2.path,
              filename: file2.path.split('/').last)
          : "",
      "file3": file3 != null
          ? await MultipartFile.fromFile(file3.path,
              filename: file3.path.split('/').last)
          : "",
      "file4": file4 != null
          ? await MultipartFile.fromFile(file4.path,
              filename: file4.path.split('/').last)
          : "",
      "task_id": taskid,
      "note": note,

      // "car_photo": carPhoto!=null? await MultipartFile.fromFile(carPhoto.path, filename: carPhoto.path.split('/').last):"",
      // "insurance_photo": insurancePhoto!=null? await MultipartFile.fromFile(insurancePhoto.path, filename: insurancePhoto.path.split('/').last):"",
      // "license_photo": licensePhoto!=null? await MultipartFile.fromFile(licensePhoto.path, filename: licensePhoto.path.split('/').last):"",
    });

    DioHelper.postData(url: "Add-Vehicles", data: formData).then((value) {
      print(value.data);
      getallReports();
    }).catchError((error) {
      print(error.toString());
    });
  }

/////////////////////////////////////////////////////////////////
  //////////////get location ////
  GetAllLocation getAllLocation;
  void getLocation() {
    DioHelper.getData(url: "All-Location").then((value) {
      emit(AppLoadingGetLocation());
      getAllLocation = GetAllLocation.fromJson(value.data);
      emit(AppScuessGetLocation());
      print(value.data);
      print("Scuess Get Location");
    }).catchError((onError) {
      emit(AppErrorGetLocation());
      print(onError.data);
      print("Scuess Get Location");
    });
  }

  //////////////
  File fileAddReport;
  File fileAddReport2;
  File fileAddReport3;
  File fileAddReport4;

  Future<void> uploadFileReport() async {
    await FilePicker.getFilePath().then((value) {
      fileAddReport = File(value);
      fileAddReport2 = File(value);
      fileAddReport3 = File(value);
      fileAddReport4 = File(value);
      emit(AppScuessUploadStates());
    }).catchError((onError) {
      print('No File selected.');
      emit(AppErrorUploadStates());
    });
  }

//////// ///////  Send Note  //////////////////////////////////////////////
  Future sendNote(String notes, String employee) {
    return DioHelper.postData(
        url: "Send-notifications",
        data: {"notes": notes, "employee": employee}).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

////////
  /////////////////////////////
  File photoimage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    await picker.getImage(source: ImageSource.gallery).then((value) {
      photoimage = File(value.path);
      emit(AppScuessProfileImageStates());
    }).catchError((onError) {
      print('No image selected.');
      emit(AppErrorProfileImageStates());
    });
  }

  /////////////////////// iqamaphoto ////////
  File iqamaphoto;
  var picker1 = ImagePicker();
  Future<void> getiqamaphotoImage() async {
    final pickedFile = await picker1.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      iqamaphoto = File(pickedFile.path);
      emit(AppScuessProfile1ImageStates());
    } else {
      print('No image selected.');
      emit(AppErrorProfile1ImageStates());
    }
  }

  /////////////////////// passport_photo ////////
  File passportphoto;
  var picker2 = ImagePicker();
  Future<void> getpassportphotoImage() async {
    final pickedFile = await picker2.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      passportphoto = File(pickedFile.path);
      emit(AppScuessProfile2ImageStates());
    } else {
      print('No image selected.');
      emit(AppErrorProfile2ImageStates());
    }
  }

  ////////////////////////////////// insurance_photo
  File insurancephoto;
  var picker3 = ImagePicker();
  Future<void> getinsurancephotoImage() async {
    final pickedFile = await picker2.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      insurancephoto = File(pickedFile.path);
      emit(AppScuessProfile3ImageStates());
    } else {
      print('No image selected.');
      emit(AppErrorProfile3ImageStates());
    }
  }

  File fileupload;

  Future<void> uploadFile() async {
    await FilePicker.getFilePath().then((value) {
      fileupload = File(value);
      emit(AppScuessUploadStates());
    }).catchError((onError) {
      print('No File selected.');
      emit(AppErrorUploadStates());
    });

    // if (result != null) {
    //   fileupload = File(result.files.single.path);
    //   emit(AppScuessUploadStates());
    // } else {

    // User canceled the picker
    //
  }

  Future<AllEmployeesModel> getEmployeesProject() async {
    AllEmployeesModel allEmployees;
    Response response = await DioHelper.postData(
        url: "All-Emploees-Project",
        token: await getSharedPrefrences("jwt"),
        data: {
          "user_id": await getSharedPrefrences("id"),
          "company_id": await getSharedPrefrences("comId")
        });
    print("uuuuuuuuuu${response.data}");
    allEmployees = AllEmployeesModel.fromJson(response.data);
    print(allEmployees);
    return allEmployees;
  }

  Future<AllEmployeesModel> getEmployeesBounce() async {
    AllEmployeesModel allEmployees;
    Response response = await DioHelper.postData(
        url: "All-Emploees-Bounce",
        token: await getSharedPrefrences("jwt"),
        data: {
          "user_id": await getSharedPrefrences("id"),
          "company_id": await getSharedPrefrences("comId")
        });
    print("uuuuuuuuuu${response.data}");
    allEmployees = AllEmployeesModel.fromJson(response.data);
    print(allEmployees);
    return allEmployees;
  }

  Future<AllEmployeesModel> getEmployeesVacation() async {
    AllEmployeesModel allEmployees;
    Response response = await DioHelper.postData(
        url: "All-Emploees-Vacation",
        token: await getSharedPrefrences("jwt"),
        data: {
          "user_id": await getSharedPrefrences("id"),
          "company_id": await getSharedPrefrences("comId")
        });
    print("uuuuuuuuuu${response.data}");
    allEmployees = AllEmployeesModel.fromJson(response.data);
    print(allEmployees);
    return allEmployees;
  }

  Future<AllEmployeesModel> getEmployeesOvertime() async {
    AllEmployeesModel allEmployees;
    Response response = await DioHelper.postData(
        url: "All-Emploees-Overtime",
        token: await getSharedPrefrences("jwt"),
        data: {
          "user_id": await getSharedPrefrences("id"),
          "company_id": await getSharedPrefrences("comId")
        });
    print("uuuuuuuuuu${response.data}");
    allEmployees = AllEmployeesModel.fromJson(response.data);
    print(allEmployees);
    return allEmployees;
  }

  Future<AllEmployeesModel> getEmployeesReport() async {
    AllEmployeesModel allEmployees;
    Response response = await DioHelper.postData(
        url: "All-Emploees-Report",
        token: await getSharedPrefrences("jwt"),
        data: {
          "user_id": await getSharedPrefrences("id"),
          "company_id": await getSharedPrefrences("comId")
        });
    print("uuuuuuuuuu${response.data}");
    allEmployees = AllEmployeesModel.fromJson(response.data);
    print(allEmployees);
    return allEmployees;
  }
}
