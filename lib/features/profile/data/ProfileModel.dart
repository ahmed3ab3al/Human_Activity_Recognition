class ProfileModel {
  ProfileModel({
    this.message,
    this.user,
    this.token,
  });

  ProfileModel.fromJson(dynamic json) {
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
    this.phone,
    this.verified,
  });

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    verified = json['verified'];
  }
  String? id;
  String? name;
  String? email;
  String? role;
  String? phone;
  bool? verified;
}
