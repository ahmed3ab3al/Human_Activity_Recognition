import '../../data/user_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class GetUserProfileLoadingState extends ProfileStates {}

class GetUserProfileSuccessState extends ProfileStates {
  final UserModel userModel;

  GetUserProfileSuccessState({required this.userModel});
}

class GetUserProfileErrorState extends ProfileStates {
  final String error;

  GetUserProfileErrorState({required this.error});
}
