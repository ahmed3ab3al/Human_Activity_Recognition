import 'package:graduation_project/features/home/data/models/SendCareRequest.dart';

abstract class MentorStates{}

class BottomInitialStates extends MentorStates{}

class ChangeBottomNavBarStates extends MentorStates{}

class SendRequestLoading extends MentorStates{}

class ChangeSendIcon extends MentorStates{}
class SendRequestSuccess extends MentorStates{
  SendCareRequest sendCareRequest;
  SendRequestSuccess({required this.sendCareRequest});
}
class SendRequestError extends MentorStates{
  final error;
  SendRequestError({this.error});
}
