class AllReports {
  bool status;
  String errNum;
  String msg;
  List<Reports> reports;

  AllReports({this.status, this.errNum, this.msg, this.reports});

  AllReports.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['reports'] != null) {
      reports = <Reports>[];
      json['reports'].forEach((v) {
        reports.add(new Reports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.reports != null) {
      data['reports'] = this.reports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reports {
  int id;
  int locationId;
  String target;
  String achievements;
  String problems;
  String file1;
  String file2;
  String file3;
  String file4;
  String taskId;
  String note;
  int userId;
  int approveuserId;
  int status;
  String createdAt;
  String updatedAt;
  User user;
  Location location;
  User approveuser;

  Reports(
      {this.id,
      this.locationId,
      this.target,
      this.achievements,
      this.problems,
      this.file1,
      this.file2,
      this.file3,
      this.file4,
      this.taskId,
      this.note,
      this.userId,
      this.approveuserId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.location,
      this.approveuser});

  Reports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['location_id'];
    target = json['target'];
    achievements = json['achievements'];
    problems = json['problems'];
    file1 = json['file1'];
    file2 = json['file2'];
    file3 = json['file3'];
    file4 = json['file4'];
    taskId = json['task_id'];
    note = json['note'];
    userId = json['user_id'];
    approveuserId = json['approveuser_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    approveuser = json['approveuser'] != null
        ? new User.fromJson(json['approveuser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location_id'] = this.locationId;
    data['target'] = this.target;
    data['achievements'] = this.achievements;
    data['problems'] = this.problems;
    data['file1'] = this.file1;
    data['file2'] = this.file2;
    data['file3'] = this.file3;
    data['file4'] = this.file4;
    data['task_id'] = this.taskId;
    data['note'] = this.note;
    data['user_id'] = this.userId;
    data['approveuser_id'] = this.approveuserId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.approveuser != null) {
      data['approveuser'] = this.approveuser.toJson();
    }
    return data;
  }
}

class User {
  int id;
  int iqama;
  String iqamaEndDate;
  String iqamaphoto;
  int passportnum;
  String passportPhoto;
  String passportEndDate;
  String name;
  String email;
  String emailVerifiedAt;
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
  String createdAt;
  String updatedAt;

  User(
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
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Location {
  int id;
  String title;
  String location;
  String lat;
  String lang;
  String createdAt;
  String updatedAt;

  Location(
      {this.id,
      this.title,
      this.location,
      this.lat,
      this.lang,
      this.createdAt,
      this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    lat = json['lat'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['location'] = this.location;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
