// To parse this JSON data, do
//
//     final allBounce = allBounceFromJson(jsonString);

import 'dart:convert';

AllBounce allBounceFromJson(String str) => AllBounce.fromJson(json.decode(str));

String allBounceToJson(AllBounce data) => json.encode(data.toJson());

class AllBounce {
  AllBounce({
    this.status,
    this.errNum,
    this.msg,
    this.payrolls,
  });

  bool status;
  String errNum;
  String msg;
  List<Payroll> payrolls;

  factory AllBounce.fromJson(Map<String, dynamic> json) => AllBounce(
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
  Type type;
  int salary;
  Employeetype employeetype;
  String token;
  int companyId;
  DateTime joiningDate;
  DateTime contractDate;
  DateTime insuranceStartDate;
  DateTime insuranceEndDate;
  String insurancePhoto;
  String contractFile;
  OtherFiles otherFiles;
  String workStart;
  String workEnd;
  String workDayes;
  int ownerId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic bounce;
  dynamic debounce;
  Status status;
  int countvation;
  Countworktime countworktime;

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
        type: typeValues.map[json["type"]],
        salary: json["salary"],
        employeetype: employeetypeValues.map[json["employeetype"]],
        token: json["token"] == null ? null : json["token"],
        companyId: json["company_id"],
        joiningDate: DateTime.parse(json["joining_date"]),
        contractDate: DateTime.parse(json["contract_date"]),
        insuranceStartDate: DateTime.parse(json["insurance_start_date"]),
        insuranceEndDate: DateTime.parse(json["insurance_end_date"]),
        insurancePhoto: json["insurance_photo"],
        contractFile: json["contract_file"],
        otherFiles: otherFilesValues.map[json["other_files"]],
        workStart: json["work_start"],
        workEnd: json["work_end"],
        workDayes: json["work_dayes"],
        ownerId: json["owner_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bounce: json["bounce"],
        debounce: json["debounce"],
        status: statusValues.map[json["status"]],
        countvation: json["countvation"],
        countworktime: countworktimeValues.map[json["countworktime"]],
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
        "type": typeValues.reverse[type],
        "salary": salary,
        "employeetype": employeetypeValues.reverse[employeetype],
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
        "other_files": otherFilesValues.reverse[otherFiles],
        "work_start": workStart,
        "work_end": workEnd,
        "work_dayes": workDayes,
        "owner_id": ownerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bounce": bounce,
        "debounce": debounce,
        "status": statusValues.reverse[status],
        "countvation": countvation,
        "countworktime": countworktimeValues.reverse[countworktime],
      };
}

class BounceClass {
  BounceClass({
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
  String employess;
  int amount;
  String reason;
  DateTime date;
  Status status;
  dynamic submituserId;
  DateTime createdAt;
  DateTime updatedAt;

  factory BounceClass.fromJson(Map<String, dynamic> json) => BounceClass(
        id: json["id"],
        type: json["type"],
        userId: json["user_id"],
        employess: json["employess"],
        amount: json["amount"],
        reason: json["reason"],
        date: DateTime.parse(json["date"]),
        status: statusValues.map[json["status"]],
        submituserId: json["submituser_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "user_id": userId,
        "employess": employess,
        "amount": amount,
        "reason": reason,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": statusValues.reverse[status],
        "submituser_id": submituserId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Status { UNPAID, PAID }

final statusValues = EnumValues({"paid": Status.PAID, "unpaid": Status.UNPAID});

enum Countworktime { THE_0144, THE_0002, THE_0000 }

final countworktimeValues = EnumValues({
  "00:00": Countworktime.THE_0000,
  "00:02": Countworktime.THE_0002,
  "01:44": Countworktime.THE_0144
});

enum Employeetype { REGULAR, PARTTIME, EMPLOYEETYPE_REGULAR }

final employeetypeValues = EnumValues({
  "Regular": Employeetype.EMPLOYEETYPE_REGULAR,
  "parttime": Employeetype.PARTTIME,
  "regular": Employeetype.REGULAR
});

enum OtherFiles {
  IMAGES_USERS_OTHERS_M_QEJ_BED_A8_FV_M4_SC5_KL_YG_D8_IT3_X1_Q_TI_X_WQ5_EG_IE_XO_PDF,
  EMPTY
}

final otherFilesValues = EnumValues({
  "": OtherFiles.EMPTY,
  "images/users/others/MQejBedA8fvM4Sc5KlYgD8IT3x1QTiXWq5EGIeXO.pdf": OtherFiles
      .IMAGES_USERS_OTHERS_M_QEJ_BED_A8_FV_M4_SC5_KL_YG_D8_IT3_X1_Q_TI_X_WQ5_EG_IE_XO_PDF
});

enum Type { MANAGER, EMPLOYEE }

final typeValues =
    EnumValues({"employee": Type.EMPLOYEE, "manager": Type.MANAGER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
