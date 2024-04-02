class EndPoints {
  static const String baseUrl = 'https://icareu.onrender.com/api/v1';
  static const String signUp = '/users/signup';
  static const String login = '/users/signin';
  static const String forgetPassword = '/users/forgotpassword';
  static const String otp = '/users/verifycode';
  static String getUserId(String id) => '/users/$id';
}

class ApiKeys {
  static const String message = 'message';
  static const String status = 'statusCode';
  static const String errMessage = 'error';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'repassword';
  // static const String token = 'token';
  static const String name = 'name';
  static const String gender = 'gender';
  static const String role = 'role';
  static const String phone = 'phone';
  static const String code = 'code';
  static const String otp = 'otp';
  static const String roleName = 'rolename';
  static const String result = 'result';
}