import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../constants.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/errors/exception.dart';
import '../../../data/get_patient_medicine.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineStates> {
  MedicineCubit(this.apiHelper) : super(CounterInitialState());

  final ApiHelper apiHelper;
  static MedicineCubit get(context) => BlocProvider.of(context);
  int dosage = 1;
  int hours = 0;
  int minute = 0;
  String system = '';
  bool isAfterMeal = false;
  final TextEditingController timeController = TextEditingController();

  void minus() {
    if (dosage > 1) {
      dosage--;
    }
    emit(CounterMinusState(dosage));
  }

  void plus() {
    if (dosage < 3) {
      dosage++;
    }
    emit(CounterPlusState(dosage));
  }

  void toggleContainer(bool value) {
    isAfterMeal = value;
    emit(ToggleIsAfterMeal());
  }

  var selectedItem = 0;
  var shapeOfMedicine = 'drink';
  void changeDragItem(int index) {
    selectedItem = index;
    if (index == 0) {
      shapeOfMedicine = 'drink';
    } else if (index == 1) {
      shapeOfMedicine = 'pill';
    } else if (index == 2) {
      shapeOfMedicine = 'rivet';
    } else {
      shapeOfMedicine = 'Injection';
    }
    emit(ChangeDragItem());
  }

  void selectDragItem(String shape){
    if(shape == 'drink'){
      selectedItem = 0;
    }
    else  if(shape == 'drink'){
      selectedItem = 0;
    }
    else  if(shape == 'pill'){
      selectedItem = 1;
    }
    else  if(shape == 'rivet'){
      selectedItem = 2;
    }
    else{
      selectedItem = 3;
    }
  }

  void addMedicine({
    required String patientID,
    required String nameOfMedicine,
  }) async {
    emit(AddMedicineLoading());
    try {
      await apiHelper.post(
        EndPoints.addMedicine,
        data: {
          "patient": patientID,
          "name": nameOfMedicine,
          "afterMeal": isAfterMeal,
          "beforeMeal": !isAfterMeal,
          "shape": shapeOfMedicine,
          "dosage": dosage,
          "repeatFor": 24 ~/ dosage,
          "time": {
            "hour": hours,
            "minutes": minute,
            'system': system,
          }
        },
      );
      timeController.clear();
      dosage = 1;
      hours = 0;
      minute = 0;
      system = '';
      isAfterMeal = false;
      emit(AddMedicineSuccess(message: "Add Medicine Success"));
    } on ServerException catch (e) {
      emit(AddMedicineError(error: e.errorModel.message));
    }
  }

  bool getPatientMedicineTrue = false;
  GetPatientMedicine? getPatientMedicine;
  void getPatientsMedicine({
    required String patientID,
  }) async {
    emit(GetPatientMedicineLoading());
    try {
      final response = await apiHelper.get(
        '${EndPoints.getPatientMedicine}$patientID',
      );
      getPatientMedicine = GetPatientMedicine.fromJson(response);
      getPatientMedicineTrue = true;
      emit(GetPatientMedicineSuccess());
    } on ServerException catch (e) {
      emit(GetPatientMedicineError(error: e.errorModel.message));
    }
  }

  void refreshPatientsMedicine(RefreshController refreshController) async {
    getPatientsMedicine(patientID: CacheHelper().getData(key: userId));
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void updateMedicine({
    required medicineId,
    required String nameOfMedicine,
}) async{
    emit(UpdateMedicineLoading());
    try {
      await apiHelper.put(
        '${EndPoints.updateMedicine}$medicineId',
        data: {
          "patient": patientID,
          "name": nameOfMedicine,
          "afterMeal": isAfterMeal,
          "beforeMeal": !isAfterMeal,
          "shape": shapeOfMedicine,
          "dosage": dosage,
          "repeatFor": 24 ~/ dosage,
          "time": {
            "hour": hours,
            "minutes": minute,
            'system': system,
          }
        },
      );
      emit(UpdateMedicineSuccess(
        message: 'Success Update'
      ));
    } on ServerException catch (e) {
      emit(UpdateMedicineError(error: e.errorModel.message));
    }
  }
}
