import 'package:graduation_project/core/api/end_points.dart';

class LoginModel{

  final String? message;
  final String? token;
  final String? role;
  final String? id;

  LoginModel({required this.id,required this.role,required this.message, required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      token: json['token'],
      role: json['user']['role'],
      id : json['user']['_id'],
    );
  }
}