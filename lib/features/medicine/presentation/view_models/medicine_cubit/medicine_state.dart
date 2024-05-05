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

class CounterChangeColorState extends MedicineStates {}
class CounterChangeTimeState extends MedicineStates {}