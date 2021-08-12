class Profile {
  bool status;
  String errNum;
  String msg;
  int numcompleted;
  int numdelay;
  int numongoing;
  User user;

  Profile(
      {this.status,
        this.errNum,
        this.msg,
        this.numcompleted,
        this.numdelay,
        this.numongoing,
        this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    numcompleted = json['numcompleted'];
    numdelay = json['numdelay'];
    numongoing = json['numongoing'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['numcompleted'] = this.numcompleted;
    data['numdelay'] = this.numdelay;
    data['numongoing'] = this.numongoing;
    if (this.user != null) {
      data['user'] = this.user.toJson();
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
  dynamic emailVerifiedAt;
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
  Notification notification;
  Task task;

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
        this.updatedAt,
        this.notification,
        this.task});

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
    notification = json['notification'] != null
        ? new Notification.fromJson(json['notification'])
        : null;
    task = json['task'] != null ? new Task.fromJson(json['task']) : null;
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
    if (this.notification != null) {
      data['notification'] = this.notification.toJson();
    }
    if (this.task != null) {
      data['task'] = this.task.toJson();
    }
    return data;
  }
}

class Notification {
  int id;
  String employee;
  String notes;
  String createdAt;
  String updatedAt;

  Notification(
      {this.id, this.employee, this.notes, this.createdAt, this.updatedAt});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employee = json['employee'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee'] = this.employee;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Task {
  int id;
  String name;
  String users;
  String start;
  String end;
  int projectId;
  String createdAt;
  String updatedAt;
  String desription;
  int status;

  Task(
      {this.id,
        this.name,
        this.users,
        this.start,
        this.end,
        this.projectId,
        this.createdAt,
        this.updatedAt,
        this.desription,
        this.status});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    users = json['users'];
    start = json['start'];
    end = json['end'];
    projectId = json['project_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    desription = json['desription'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['users'] = this.users;
    data['start'] = this.start;
    data['end'] = this.end;
    data['project_id'] = this.projectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['desription'] = this.desription;
    data['status'] = this.status;
    return data;
  }
}