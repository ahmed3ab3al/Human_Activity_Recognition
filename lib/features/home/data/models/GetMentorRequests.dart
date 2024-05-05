class GetMentorRequests {
  String? message;
  List<Result>? result;

  GetMentorRequests({
    this.message,
    this.result,
  });

  GetMentorRequests.fromJson(dynamic json) {
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
  }
}

class Mentor {
  String? id;
  String? name;
  String? email;

  Mentor({
    this.id,
    this.name,
    this.email,
  });

  Mentor.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }
}

class Result {
  String? id;
  String? patient;
  Mentor? mentor;
  String? status;
  String? createdAt;
  String? updatedAt;
  num? v;

  Result({
    this.id,
    this.patient,
    this.mentor,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Result.fromJson(dynamic json) {
    id = json['_id'];
    patient = json['patient'];
    mentor = json['mentor'] != null ? Mentor.fromJson(json['mentor']) : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}
