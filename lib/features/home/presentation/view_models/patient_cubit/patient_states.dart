abstract class PatientStates{}

class BottomInitialStates extends PatientStates{}

class ChangeBottomNavBarStates extends PatientStates{}

class GetMentorRequestsSuccess extends PatientStates{}
class GetMentorRequestsLoading extends PatientStates{}
class GetMentorRequestsError extends PatientStates{
  final error;
  GetMentorRequestsError({this.error});
}

class ConfirmRequestSuccess extends PatientStates{}
class ConfirmRequestLoading extends PatientStates{}
class ConfirmRequestError extends PatientStates{
  final error;
  ConfirmRequestError({this.error});
}