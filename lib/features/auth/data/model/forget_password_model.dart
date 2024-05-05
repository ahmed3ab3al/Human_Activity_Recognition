import 'package:graduation_project/core/api/end_points.dart';

class ForgetPasswordModel {
  String email;
  String message;
  ForgetPasswordModel({required this.email, required this.message});
  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      email: json['user'][ApiKeys.email],
      message: json[ApiKeys.message],
    );
  }
}
