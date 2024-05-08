import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import '../../../../../core/errors/exception.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineStates> {
  MedicineCubit(this.apiHelper) : super(CounterInitialState());

  final ApiHelper apiHelper;
  static MedicineCubit get(context) => BlocProvider.of(context);
  int dosage = 1;
  int hours = 0;
  int minute = 0;
  bool isFirstContainerSelected = false;
  final TextEditingController timeController = TextEditingController();

  void minus() {
    if (dosage > 1) {
      dosage--;
    }
    emit(CounterMinusState(dosage));
  }

  void plus() {
    if(dosage < 3 ) {
      dosage++;
    }
    emit(CounterPlusState(dosage));
  }

  void toggleContainer(bool value) {
    isFirstContainerSelected = value;
    emit(CounterChangeColorState());
  }
  var  selectedItem = 0;
  var  shapeOfMedicine = 'drink';
  void changeDragItem(int index){
    selectedItem = index;
    if (index == 0) {
      shapeOfMedicine = 'drink';
    } else if (index == 1)
      {
        shapeOfMedicine = 'pill';
      }
    else if (index == 2)
      {
        shapeOfMedicine = 'rivet';
      }
    else
      {
        shapeOfMedicine = 'Injection';
      }
    emit(ChangeDragItem());
  }

  void addMedicine({
    required String patientID,
    required String nameOfMedicine,
})async{
    emit(AddMedicineLoading());
    try{
      await apiHelper.post(
        EndPoints.addMedicine,
        data: {
          "patient" : patientID,
          "name" : nameOfMedicine,
          "shape" : shapeOfMedicine,
          "dosage" : dosage,
          "repeatFor" : 24 ~/ dosage,
          "time" : {
            "hour" : hours,
            "minutes" : minute,
          }
        },
      );
      timeController.clear();
      dosage = 1; hours = 0;
      minute = 0; isFirstContainerSelected = false;
      emit(AddMedicineSuccess(message: "Success"));
    } on ServerException catch (e) {
      emit(AddMedicineError(error: e.errorModel.message));
    }
  }
}
