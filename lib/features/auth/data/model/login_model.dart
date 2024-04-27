// import 'package:graduation_project/core/api/end_points.dart';
//
// class LoginModel{
//
//   final String? message;
//   final String? token;
//   final String? role;
//   final String? id;
//
//   LoginModel({required this.id,required this.role,required this.message, required this.token});
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//       message: json['message'],
//       token: json['token'],
//       role: json['user']['role'],
//       id : json['user']['_id'],
//     );
//   }
// }

class LoginModel {
  LoginModel({
    this.message,
    this.user,
    this.token,});

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.verified,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    verified = json['verified'];
  }
  String? id;
  String? name;
  String? email;
  String? role;
  bool? verified;
}