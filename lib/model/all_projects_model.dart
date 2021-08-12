class AllProjectModel {
  bool status;
  String errNum;
  String msg;
  int numComplete;
  int numdelay;
  int numongoing;
  List<Project> projects;

  AllProjectModel({this.status, this.errNum, this.msg, this.projects});

  AllProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numComplete = json['numcompleted'];
    numdelay = json['numdelay'];
    numongoing = json['numongoing'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['projects'] != null) {
      projects = new List<Project>();
      json['projects'].forEach((v) {
        projects.add(new Project.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['numcompleted'] = this.numComplete;
    data['numdelay'] = this.numdelay;
    data['numongoing'] = this.numongoing;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.projects != null) {
      data['projects'] = this.projects.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Project {
  int id;
  String name;
  String type;
  int status;
  String value;
  dynamic invoicesNo;
  String startDate;
  String endDate;
  String deadline;
  int locationId;
  List<Employee> employees;
  List<Vehicles> vehicles;
  String schedualLink;
  String contractLink;
  dynamic othersfile;
  List<Employee> taskCreator;
  String photo;
  String notes;
  String createdAt;
  String updatedAt;
  List<Task> task;
  Location location;

  Project(
      {this.id,
        this.name,
        this.type,
        this.status,
        this.value,
        this.invoicesNo,
        this.startDate,
        this.endDate,
        this.deadline,
        this.locationId,
        this.employees,
        this.vehicles,
        this.schedualLink,
        this.contractLink,
        this.othersfile,
        this.taskCreator,
        this.photo,
        this.notes,
        this.createdAt,
        this.updatedAt,
        this.task,
        this.location});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    value = json['value'];
    invoicesNo = json['invoices_no'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    deadline = json['deadline'];
    locationId = json['location_id'];
    if (json['employees'] != null) {
      employees = new List<Employee>();
      json['employees'].forEach((v) {
        employees.add(new Employee.fromJson(v));
      });
    }
    if (json['vehicles'] != null) {
      vehicles = new List<Vehicles>();
      json['vehicles'].forEach((v) {
        vehicles.add(new Vehicles.fromJson(v));
      });
    }
    schedualLink = json['schedual_link'];
    contractLink = json['contract_link'];
    othersfile = json['othersfile'];
    if (json['task_creator'] != null) {
      taskCreator = new List<Employee>();
      json['task_creator'].forEach((v) {
        taskCreator.add(new Employee.fromJson(v));
      });
    }
    photo = json['photo'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['task'] != null) {
      task = new List<Task>();
      json['task'].forEach((v) {
        task.add(new Task.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['value'] = this.value;
    data['invoices_no'] = this.invoicesNo;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['deadline'] = this.deadline;
    data['location_id'] = this.locationId;
    if (this.employees != null) {
      data['employees'] = this.employees.map((v) => v.toJson()).toList();
    }
    if (this.vehicles != null) {
      data['vehicles'] = this.vehicles.map((v) => v.toJson()).toList();
    }
    data['schedual_link'] = this.schedualLink;
    data['contract_link'] = this.contractLink;
    data['othersfile'] = this.othersfile;
    if (this.taskCreator != null) {
      data['task_creator'] = this.taskCreator.map((v) => v.toJson()).toList();
    }
    data['photo'] = this.photo;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.task != null) {
      data['task'] = this.task.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
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

class Vehicles {
  int id;
  int number;
  String name;
  String model;
  String status;
  int kilometer;
  String insuranceDateStart;
  String insuranceDateEnd;
  String insurancePhoto;
  int licenseNumber;
  String licenseDateEnd;
  String licensePhoto;
  String examinationDate;
  int userId;
  String driverLicense;
  String locations;
  String carPhoto;
  String notes;
  String createdAt;
  String updatedAt;

  Vehicles(
      {this.id,
        this.number,
        this.name,
        this.model,
        this.status,
        this.kilometer,
        this.insuranceDateStart,
        this.insuranceDateEnd,
        this.insurancePhoto,
        this.licenseNumber,
        this.licenseDateEnd,
        this.licensePhoto,
        this.examinationDate,
        this.userId,
        this.driverLicense,
        this.locations,
        this.carPhoto,
        this.notes,
        this.createdAt,
        this.updatedAt});

  Vehicles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    model = json['model'];
    status = json['status'];
    kilometer = json['kilometer'];
    insuranceDateStart = json['insurance_date_start'];
    insuranceDateEnd = json['insurance_date_end'];
    insurancePhoto = json['insurance_photo'];
    licenseNumber = json['license_number'];
    licenseDateEnd = json['license_date_end'];
    licensePhoto = json['license_photo'];
    examinationDate = json['examination_date'];
    userId = json['user_id'];
    driverLicense = json['driver_license'];
    locations = json['locations'];
    carPhoto = json['car_photo'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    data['model'] = this.model;
    data['status'] = this.status;
    data['kilometer'] = this.kilometer;
    data['insurance_date_start'] = this.insuranceDateStart;
    data['insurance_date_end'] = this.insuranceDateEnd;
    data['insurance_photo'] = this.insurancePhoto;
    data['license_number'] = this.licenseNumber;
    data['license_date_end'] = this.licenseDateEnd;
    data['license_photo'] = this.licensePhoto;
    data['examination_date'] = this.examinationDate;
    data['user_id'] = this.userId;
    data['driver_license'] = this.driverLicense;
    data['locations'] = this.locations;
    data['car_photo'] = this.carPhoto;
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