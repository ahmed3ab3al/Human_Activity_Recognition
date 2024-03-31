import '../../../../core/api/end_points.dart';

class  VerifyCode{

   final String message;
   final String result;

  VerifyCode({required this.message, required this.result});

  factory VerifyCode.fromJson(Map<String, dynamic> json) {
    return VerifyCode(
      message: json[ApiKeys.message],
      result: json[ApiKeys.result],
    );
  }
}