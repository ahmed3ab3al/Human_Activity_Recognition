part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ChangeSecureState extends ForgetPasswordState{}
class CheckEmailLoadingState extends ForgetPasswordState {}
class CheckEmailSuccessState extends ForgetPasswordState {
  final String message;
  CheckEmailSuccessState({required this.message});
}
class CheckEmailErrorState extends ForgetPasswordState {
  final String error;
  CheckEmailErrorState({required this.error});
}

class VerifyCodeLoadingState extends ForgetPasswordState {}
class VerifyCodeSuccessState extends ForgetPasswordState {
  final String message;
  VerifyCodeSuccessState({required this.message});
}
class VerifyCodeErrorState extends ForgetPasswordState {
  final String error;
  VerifyCodeErrorState({required this.error});
}


class ResetPasswordLoadingState extends ForgetPasswordState {}
class ResetPasswordSuccessState extends ForgetPasswordState {
  final String message;
  ResetPasswordSuccessState({required this.message});
}
class ResetPasswordErrorState extends ForgetPasswordState {
  final String error;
  ResetPasswordErrorState({required this.error});
}