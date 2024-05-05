import 'package:graduation_project/core/api/end_points.dart';

class ErrorModel {
  int status;
  String message;

  ErrorModel({required this.status, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKeys.status],
      message: json[ApiKeys.errMessage],
    );
  }
}
