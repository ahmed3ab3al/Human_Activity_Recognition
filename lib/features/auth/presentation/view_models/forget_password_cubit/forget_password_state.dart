part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class CheckEmailLoadingState extends ForgetPasswordState {}
class CheckEmailSuccessState extends ForgetPasswordState {
  final String message;
  CheckEmailSuccessState({required this.message});
}
class CheckEmailErrorState extends ForgetPasswordState {
  final String error;
  CheckEmailErrorState({required this.error});
}

class AuthVerifyCodeLoadingState extends ForgetPasswordState {}
class AuthVerifyCodeSuccessState extends ForgetPasswordState {
  final String message;
  AuthVerifyCodeSuccessState({required this.message});
}
class AuthVerifyCodeErrorState extends ForgetPasswordState {
  final String error;
  AuthVerifyCodeErrorState({required this.error});
}
