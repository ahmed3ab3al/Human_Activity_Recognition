import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/features/medicine/data/GetPatientMedicine.dart';
import '../../../../../core/errors/exception.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineStates> {
  MedicineCubit(this.apiHelper) : super(CounterInitialState());

  final ApiHelper apiHelper;
  static MedicineCubit get(context) => BlocProvider.of(context);
  int dosage = 1;
  int hours = 0;
  int minute = 0;
  bool isAfterMeal = false;
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
    isAfterMeal = value;
    emit(ToggleIsAfterMeal());
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
          "afterMeal":isAfterMeal,
          "beforeMeal":!isAfterMeal,
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
      minute = 0; isAfterMeal = false;
      emit(AddMedicineSuccess(message: "Add Medicine Success"));
    } on ServerException catch (e) {
      emit(AddMedicineError(error: e.errorModel.message));
    }
  }



  GetPatientMedicine? getPatientMedicine;
  void getPatientsMedicine({
    required String patientID,
})async{
    emit(GetPatientMedicineLoading());
    try{
      final response = await apiHelper.get(
        '${EndPoints.getPatientMedicine}$patientID',
      );
      getPatientMedicine = GetPatientMedicine.fromJson(response);
      emit(GetPatientMedicineSuccess());
    } on ServerException catch (e) {
      emit(GetPatientMedicineError(error: e.errorModel.message));
    }
  }
}
