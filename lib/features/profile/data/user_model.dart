import '../../../../core/api/end_points.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['result']['_id'],
      name: json['result'][ApiKeys.name],
      email: json['result'][ApiKeys.email],
    );
  }
}
