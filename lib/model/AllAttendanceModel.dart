class AllAtendanceModel {
  bool status;
  String errNum;
  int countvation;
  int attend;
  int absent;
  String msg;
  List<Attends> attends;

  AllAtendanceModel(
      {this.status,
        this.errNum,
        this.countvation,
        this.attend,
        this.absent,
        this.msg,
        this.attends});

  AllAtendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    countvation = json['countvation'];
    attend = json['attend'];
    absent = json['absent'];
    msg = json['msg'];
    if (json['attends'] != null) {
      attends = new List<Attends>();
      json['attends'].forEach((v) {
        attends.add(new Attends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['countvation'] = this.countvation;
    data['attend'] = this.attend;
    data['absent'] = this.absent;
    data['msg'] = this.msg;
    if (this.attends != null) {
      data['attends'] = this.attends.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attends {
  int id;
  int userId;
  int locationId;
  String type;
  String createdAt;
  String updatedAt;
  String overtime;
  String counttime;
  User user;
  Location location;

  Attends(
      {this.id,
        this.userId,
        this.locationId,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.overtime,
        this.counttime,
        this.user,
        this.location});

  Attends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    locationId = json['location_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    overtime = json['overtime'];
    counttime = json['counttime'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['location_id'] = this.locationId;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['overtime'] = this.overtime;
    data['counttime'] = this.counttime;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
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
        this.ownerId,
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