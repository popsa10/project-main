// To parse this JSON data, do
//
//     final searchPayroll = searchPayrollFromJson(jsonString);

import 'dart:convert';

SearchPayroll searchPayrollFromJson(String str) =>
    SearchPayroll.fromJson(json.decode(str));

String searchPayrollToJson(SearchPayroll data) => json.encode(data.toJson());

class SearchPayroll {
  SearchPayroll({
    this.status,
    this.errNum,
    this.msg,
    this.payrolls,
  });

  bool status;
  String errNum;
  String msg;
  List<Payroll> payrolls;

  factory SearchPayroll.fromJson(Map<String, dynamic> json) => SearchPayroll(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        payrolls: List<Payroll>.from(
            json["payrolls"].map((x) => Payroll.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "payrolls": List<dynamic>.from(payrolls.map((x) => x.toJson())),
      };
}

class Payroll {
  Payroll({
    this.id,
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
    this.bounce,
    this.debounce,
    this.status,
    this.countvation,
    this.countworktime,
  });

  int id;
  int iqama;
  DateTime iqamaEndDate;
  String iqamaphoto;
  int passportnum;
  String passportPhoto;
  DateTime passportEndDate;
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
  DateTime joiningDate;
  DateTime contractDate;
  DateTime insuranceStartDate;
  DateTime insuranceEndDate;
  String insurancePhoto;
  String contractFile;
  String otherFiles;
  String workStart;
  String workEnd;
  String workDayes;
  int ownerId;
  DateTime createdAt;
  DateTime updatedAt;
  String bounce;
  String debounce;
  String status;
  int countvation;
  String countworktime;

  factory Payroll.fromJson(Map<String, dynamic> json) => Payroll(
        id: json["id"],
        iqama: json["iqama"],
        iqamaEndDate: DateTime.parse(json["iqama_end_date"]),
        iqamaphoto: json["iqamaphoto"],
        passportnum: json["passportnum"],
        passportPhoto: json["passport_photo"],
        passportEndDate: DateTime.parse(json["passport_end_date"]),
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        photo: json["photo"],
        type: json["type"],
        salary: json["salary"],
        employeetype: json["employeetype"],
        token: json["token"],
        companyId: json["company_id"],
        joiningDate: DateTime.parse(json["joining_date"]),
        contractDate: DateTime.parse(json["contract_date"]),
        insuranceStartDate: DateTime.parse(json["insurance_start_date"]),
        insuranceEndDate: DateTime.parse(json["insurance_end_date"]),
        insurancePhoto: json["insurance_photo"],
        contractFile: json["contract_file"],
        otherFiles: json["other_files"],
        workStart: json["work_start"],
        workEnd: json["work_end"],
        workDayes: json["work_dayes"],
        ownerId: json["owner_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bounce: json["bounce"],
        debounce: json["debounce"],
        status: json["status"],
        countvation: json["countvation"],
        countworktime: json["countworktime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iqama": iqama,
        "iqama_end_date":
            "${iqamaEndDate.year.toString().padLeft(4, '0')}-${iqamaEndDate.month.toString().padLeft(2, '0')}-${iqamaEndDate.day.toString().padLeft(2, '0')}",
        "iqamaphoto": iqamaphoto,
        "passportnum": passportnum,
        "passport_photo": passportPhoto,
        "passport_end_date":
            "${passportEndDate.year.toString().padLeft(4, '0')}-${passportEndDate.month.toString().padLeft(2, '0')}-${passportEndDate.day.toString().padLeft(2, '0')}",
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "photo": photo,
        "type": type,
        "salary": salary,
        "employeetype": employeetype,
        "token": token,
        "company_id": companyId,
        "joining_date":
            "${joiningDate.year.toString().padLeft(4, '0')}-${joiningDate.month.toString().padLeft(2, '0')}-${joiningDate.day.toString().padLeft(2, '0')}",
        "contract_date":
            "${contractDate.year.toString().padLeft(4, '0')}-${contractDate.month.toString().padLeft(2, '0')}-${contractDate.day.toString().padLeft(2, '0')}",
        "insurance_start_date":
            "${insuranceStartDate.year.toString().padLeft(4, '0')}-${insuranceStartDate.month.toString().padLeft(2, '0')}-${insuranceStartDate.day.toString().padLeft(2, '0')}",
        "insurance_end_date":
            "${insuranceEndDate.year.toString().padLeft(4, '0')}-${insuranceEndDate.month.toString().padLeft(2, '0')}-${insuranceEndDate.day.toString().padLeft(2, '0')}",
        "insurance_photo": insurancePhoto,
        "contract_file": contractFile,
        "other_files": otherFiles,
        "work_start": workStart,
        "work_end": workEnd,
        "work_dayes": workDayes,
        "owner_id": ownerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bounce": bounce,
        "debounce": debounce,
        "status": status,
        "countvation": countvation,
        "countworktime": countworktime,
      };
}
