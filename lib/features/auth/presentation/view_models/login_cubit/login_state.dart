part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message;
  LoginSuccessState({required this.message});
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState({required this.error});
}

class ChangeSecureState extends LoginState {}
