abstract class MentorMedicineStates {}

class CounterInitialState extends MentorMedicineStates {}

class CounterPlusState extends MentorMedicineStates {
  final int counter;
  CounterPlusState(this.counter);
}

class CounterMinusState extends MentorMedicineStates {
  final int counter;
  CounterMinusState(this.counter);
}

class ToggleIsAfterMeal extends MentorMedicineStates {}

class CounterChangeTimeState extends MentorMedicineStates {}

class ChangeDragItem extends MentorMedicineStates {}

class AddMedicineLoading extends MentorMedicineStates {}
class AddMedicineSuccess extends MentorMedicineStates {
  final message;
  AddMedicineSuccess({this.message});
}
class AddMedicineError extends MentorMedicineStates {
  final error;
  AddMedicineError({this.error});
}

class GetPatientMedicineLoading extends MentorMedicineStates {}
class GetPatientMedicineSuccess extends MentorMedicineStates {}
class GetPatientMedicineError extends MentorMedicineStates {
  final error;
  GetPatientMedicineError({this.error});
}