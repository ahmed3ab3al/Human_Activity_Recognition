import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineStates> {
  MedicineCubit() : super(CounterInitialState());

  static MedicineCubit get(context) => BlocProvider.of(context);
  int counter = 1;
  bool isFirstContainerSelected = false;
  final TextEditingController timeController = TextEditingController();

  void minus() {
    if (counter > 1) {
      counter--;
    }
    emit(CounterMinusState(counter));
  }

  void plus() {
    if(counter < 3 ) {
      counter++;
    }
    emit(CounterPlusState(counter));
  }

  void toggleContainer(bool value) {
    isFirstContainerSelected = value;
    emit(CounterChangeColorState());
  }




}
