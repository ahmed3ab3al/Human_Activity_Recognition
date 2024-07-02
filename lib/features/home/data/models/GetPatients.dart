class GetPatients {
  GetPatients({
    this.message,
    this.result,
  });

  GetPatients.fromJson(dynamic json) {
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
}

class Result {
  Result({
    this.id,
    this.patient,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.mentor,
  });

  Result.fromJson(dynamic json) {
    id = json['_id'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    mentor = json['mentor'];
  }
  String? id;
  Patient? patient;
  String? type;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? mentor;
}
