import '../../../../core/api/end_points.dart';

class  VerifyCode{
   final String? message;
   final String? token;

  VerifyCode({required this.message, required this.token});

  factory VerifyCode.fromJson(Map<String, dynamic> json) {
    return VerifyCode(
      message: json[ApiKeys.message],
      token: json['token'],
    );
  }
}