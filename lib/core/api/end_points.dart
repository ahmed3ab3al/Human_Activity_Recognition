class EndPoints {
  static const String baseUrl = 'https://icareu.onrender.com/api/v1';
  static const String signUp = '/users/signup';
  static const String login = '/users/signin';
  static const String forgetPassword = '/users/forgotpassword';
  static const String otp = '/users/verify-reset-password-code';
  static const String confirm_reset_password = '/users/confirm-reset-password';
  static String getUserId(String id) => '/users/$id';
  static const String sendRequest = '/mentors';
  static const String getMentorRequest = '/patients/all-requests';
  static const String confirmRequest = '/patients/confirm/';
}

class ApiKeys {
  static const String message = 'message';
  static const String status = 'statusCode';
  static const String errMessage = 'error';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'repassword';
  static const String name = 'name';
  static const String gender = 'gender';
  static const String role = 'role';
  static const String phone = 'phone';
  static const String code = 'code';
  static const String otp = 'otp';
  static const String result = 'result';
}