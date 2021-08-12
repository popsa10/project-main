// To parse this JSON data, do
//
//     final allDetuctions = allDetuctionsFromJson(jsonString);

import 'dart:convert';

AllDetuctions allDetuctionsFromJson(String str) =>
    AllDetuctions.fromJson(json.decode(str));

String allDetuctionsToJson(AllDetuctions data) => json.encode(data.toJson());

class AllDetuctions {
  AllDetuctions({
    this.status,
    this.errNum,
    this.msg,
    this.detuctions,
  });

  bool status;
  String errNum;
  String msg;
  List<Detuction> detuctions;

  factory AllDetuctions.fromJson(Map<String, dynamic> json) => AllDetuctions(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        detuctions: List<Detuction>.from(
            json["detuctions"].map((x) => Detuction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "detuctions": List<dynamic>.from(detuctions.map((x) => x.toJson())),
      };
}

class Detuction {
  Detuction({
    this.id,
    this.type,
    this.userId,
    this.employess,
    this.amount,
    this.reason,
    this.date,
    this.status,
    this.submituserId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String type;
  int userId;
  List<Employess> employess;
  int amount;
  String reason;
  DateTime date;
  String status;
  dynamic submituserId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Detuction.fromJson(Map<String, dynamic> json) => Detuction(
        id: json["id"],
        type: json["type"],
        userId: json["user_id"],
        employess: List<Employess>.from(
            json["employess"].map((x) => Employess.fromJson(x))),
        amount: json["amount"],
        reason: json["reason"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        submituserId: json["submituser_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "user_id": userId,
        "employess": List<dynamic>.from(employess.map((x) => x.toJson())),
        "amount": amount,
        "reason": reason,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": status,
        "submituser_id": submituserId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Employess {
  Employess({
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
    this.createdAt,
    this.updatedAt,
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
  DateTime createdAt;
  DateTime updatedAt;

  factory Employess.fromJson(Map<String, dynamic> json) => Employess(
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
        token: json["token"] == null ? null : json["token"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "token": token == null ? null : token,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
