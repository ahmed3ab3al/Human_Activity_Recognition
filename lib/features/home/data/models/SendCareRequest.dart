class SendCareRequest {
  String? message;
  Result? result;

  SendCareRequest({
    this.message,
    this.result,
  });

  SendCareRequest.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  String? patient;
  String? mentor;
  String? status;
  String? id;

  Result({
    this.patient,
    this.mentor,
    this.status,
    this.id,
  });

  Result.fromJson(dynamic json) {
    patient = json['patient'];
    mentor = json['mentor'];
    status = json['status'];
    id = json['_id'];
  }
}
