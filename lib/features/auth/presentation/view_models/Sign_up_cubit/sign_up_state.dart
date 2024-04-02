part of 'sign_up_cubit.dart';


abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class AuthSignUpLoadingState extends SignUpState {}
class AuthSignUpSuccessState extends SignUpState {
  final String message;
  AuthSignUpSuccessState({required this.message});
}
class AuthSignUpErrorState extends SignUpState {

  final String error;
  AuthSignUpErrorState({required this.error});
}

class ChangeSecureState extends SignUpState {}
class ChangeGenderState extends SignUpState {}
