class GetPatientMedicine {
  GetPatientMedicine({
    this.message,
    this.result,
  });

  GetPatientMedicine.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
  }
  String? message;
  List<Result>? result;
}

class Result {
  Result({
    this.time,
    this.id,
    this.patient,
    this.name,
    this.shape,
    this.dosage,
    this.repeatFor,
    this.afterMeal,
    this.beforeMeal,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Result.fromJson(dynamic json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    id = json['_id'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    name = json['name'];
    shape = json['shape'];
    dosage = json['dosage'];
    repeatFor = json['repeatFor'];
    afterMeal = json['afterMeal'];
    beforeMeal = json['beforeMeal'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  Time? time;
  String? id;
  Patient? patient;
  String? name;
  String? shape;
  num? dosage;
  num? repeatFor;
  bool? afterMeal;
  bool? beforeMeal;
  String? createdAt;
  String? updatedAt;
  num? v;
}

class Patient {
  Patient({
    this.id,
    this.name,
  });

  Patient.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    return map;
  }
}

class Time {
  Time({this.system, this.hour, this.minute});

  Time.fromJson(dynamic json) {
    system = json['system'];
    hour = json['hour'];
    minute = json['minutes'];
  }
  dynamic system;
  dynamic hour;
  dynamic minute;
}
