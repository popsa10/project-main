class VacationModel {
  bool status;
  String errNum;
  String msg;
  List<Vacations> vacations;

  VacationModel({this.status, this.errNum, this.msg, this.vacations});

  VacationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['vacations'] != null) {
      vacations = new List<Vacations>();
      json['vacations'].forEach((v) {
        vacations.add(new Vacations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.vacations != null) {
      data['vacations'] = this.vacations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vacations {
  int id;
  String type;
  String name;
  String startDate;
  String endDate;
  Employee employee;
  int userId;
  String reason;
  int status;
  String createdAt;
  String updatedAt;
  Employee submituser;

  Vacations(
      {this.id,
      this.type,
      this.name,
      this.startDate,
      this.endDate,
      this.employee,
      this.userId,
      this.reason,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.submituser});

  Vacations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    userId = json['user_id'];
    reason = json['reason'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    submituser = json['submituser'] != null
        ? new Employee.fromJson(json['submituser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    data['user_id'] = this.userId;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.submituser != null) {
      data['submituser'] = this.submituser.toJson();
    }
    return data;
  }
}

class Employee {
  int id;
  int iqama;
  String iqamaEndDate;
  String iqamaphoto;
  int passportnum;
  String passportPhoto;
  String passportEndDate;
  String name;
  String email;
  Null emailVerifiedAt;
  int phone;
  String photo;
  String type;
  int salary;
  String employeetype;
  String token;
  int companyId;
  String joiningDate;
  String contractDate;
  String insuranceStartDate;
  String insuranceEndDate;
  String insurancePhoto;
  String contractFile;
  String otherFiles;
  String workStart;
  String workEnd;
  String workDayes;
  int ownerId;
  String createdAt;
  String updatedAt;

  Employee(
      {this.id,
      this.iqama,
      this.iqamaEndDate,
      this.iqamaphoto,
      this.passportnum,
      this.passportPhoto,
      this.passportEndDate,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.photo,
      this.type,
      this.salary,
      this.employeetype,
      this.token,
      this.companyId,
      this.joiningDate,
      this.contractDate,
      this.insuranceStartDate,
      this.insuranceEndDate,
      this.insurancePhoto,
      this.contractFile,
      this.otherFiles,
      this.workStart,
      this.workEnd,
      this.workDayes,
      this.ownerId,
      this.createdAt,
      this.updatedAt});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iqama = json['iqama'];
    iqamaEndDate = json['iqama_end_date'];
    iqamaphoto = json['iqamaphoto'];
    passportnum = json['passportnum'];
    passportPhoto = json['passport_photo'];
    passportEndDate = json['passport_end_date'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    photo = json['photo'];
    type = json['type'];
    salary = json['salary'];
    employeetype = json['employeetype'];
    token = json['token'];
    companyId = json['company_id'];
    joiningDate = json['joining_date'];
    contractDate = json['contract_date'];
    insuranceStartDate = json['insurance_start_date'];
    insuranceEndDate = json['insurance_end_date'];
    insurancePhoto = json['insurance_photo'];
    contractFile = json['contract_file'];
    otherFiles = json['other_files'];
    workStart = json['work_start'];
    workEnd = json['work_end'];
    workDayes = json['work_dayes'];
    ownerId = json['owner_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iqama'] = this.iqama;
    data['iqama_end_date'] = this.iqamaEndDate;
    data['iqamaphoto'] = this.iqamaphoto;
    data['passportnum'] = this.passportnum;
    data['passport_photo'] = this.passportPhoto;
    data['passport_end_date'] = this.passportEndDate;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['type'] = this.type;
    data['salary'] = this.salary;
    data['employeetype'] = this.employeetype;
    data['token'] = this.token;
    data['company_id'] = this.companyId;
    data['joining_date'] = this.joiningDate;
    data['contract_date'] = this.contractDate;
    data['insurance_start_date'] = this.insuranceStartDate;
    data['insurance_end_date'] = this.insuranceEndDate;
    data['insurance_photo'] = this.insurancePhoto;
    data['contract_file'] = this.contractFile;
    data['other_files'] = this.otherFiles;
    data['work_start'] = this.workStart;
    data['work_end'] = this.workEnd;
    data['work_dayes'] = this.workDayes;
    data['owner_id'] = this.ownerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
