import '../../../../core/api/end_points.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['result']['_id'],
      phone: json['result'][ApiKeys.phone],
      name: json['result'][ApiKeys.name],
      email: json['result'][ApiKeys.email],
    );
  }
}