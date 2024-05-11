abstract class MedicineStates {}

class CounterInitialState extends MedicineStates {}

class CounterPlusState extends MedicineStates {
  final int counter;
  CounterPlusState(this.counter);
}

class CounterMinusState extends MedicineStates {
  final int counter;
  CounterMinusState(this.counter);
}

class ToggleIsAfterMeal extends MedicineStates {}

class CounterChangeTimeState extends MedicineStates {}

class ChangeDragItem extends MedicineStates {}

class AddMedicineLoading extends MedicineStates {}
class AddMedicineSuccess extends MedicineStates {
  final message;
  AddMedicineSuccess({this.message});
}
class AddMedicineError extends MedicineStates {
  final error;
  AddMedicineError({this.error});
}

class GetPatientMedicineLoading extends MedicineStates {}
class GetPatientMedicineSuccess extends MedicineStates {}
class GetPatientMedicineError extends MedicineStates {
  final error;
  GetPatientMedicineError({this.error});
}