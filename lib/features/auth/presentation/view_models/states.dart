abstract class AuthStates {}


class AuthInitialState extends AuthStates {}



class AuthLoginLoadingState extends AuthStates {}
class AuthLoginSuccessState extends AuthStates {
  final String message;
  AuthLoginSuccessState({required this.message});
}
class AuthLoginErrorState extends AuthStates {

  final String error;
  AuthLoginErrorState({required this.error});
}



class AuthSignUpLoadingState extends AuthStates {}
class AuthSignUpSuccessState extends AuthStates {
  final String message;
  AuthSignUpSuccessState({required this.message});
}
class AuthSignUpErrorState extends AuthStates {

  final String error;
  AuthSignUpErrorState({required this.error});
}


class ChangeGenderState extends AuthStates {}
class LoadingGenderState extends AuthStates {}

class ChangeSecureState extends AuthStates {}




class AuthCheckEmailLoadingState extends AuthStates {}
class AuthCheckEmailSuccessState extends AuthStates {
  final String message;
  AuthCheckEmailSuccessState({required this.message});
}
class AuthCheckEmailErrorState extends AuthStates {
  final String error;
  AuthCheckEmailErrorState({required this.error});
}


class AuthVerifyCodeLoadingState extends AuthStates {}
class AuthVerifyCodeSuccessState extends AuthStates {
  final String message;
  AuthVerifyCodeSuccessState({required this.message});
}
class AuthVerifyCodeErrorState extends AuthStates {
  final String error;
  AuthVerifyCodeErrorState({required this.error});
}