import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/data/models/GetPatients.dart';
import 'package:graduation_project/features/home/data/models/SendCareRequest.dart';
import 'package:graduation_project/features/map/presentation/views/map.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/api/api_helper.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../medicine/presentation/views/widgets/mentor_medicine_view_body.dart';
import 'mentor_states.dart';

class MentorCubit extends Cubit<MentorStates> {
  MentorCubit(this.apiHelper) : super(BottomInitialStates());

  final ApiHelper apiHelper;
  static MentorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> activeBottomItems = [
    Icon(
      Icons.medication_rounded,
      color: ColorManager.whiteColor,
      size: 24.sp,
    ),
    Icon(
      Icons.location_on_outlined,
      color: ColorManager.whiteColor,
      size: 24.sp,
    ),
    Icon(
      Icons.chat_bubble,
      color: ColorManager.whiteColor,
      size: 24.sp,
    ),
  ];
  List<Widget> inActiveBottomItems = [
    Icon(
      Icons.medication_rounded,
      color: ColorManager.greyColor757474,
      size: 24.sp,
    ),
    Icon(
      Icons.location_on_outlined,
      color: ColorManager.greyColor757474,
      size: 24.sp,
    ),
    Icon(
      Icons.chat_bubble,
      color: ColorManager.greyColor757474,
      size: 24.sp,
    ),
  ];

  List<Widget> screens = [
    const MentorMedicineViewBody(),
    const LocationPage(),
    // const DangerousActivityViewBody(),
  ];

  void changeBottomNavBar(int index) {
    if (index != 2) {
      currentIndex = index;
    }
    emit(ChangeBottomNavBarStates());
  }

  IconData fabIcon = Icons.add;
  bool isBottomSheetShown = false;
  void changeSendIcon({required bool add}) {
    if (add) {
      fabIcon = Icons.add;
      isBottomSheetShown = false;
    } else {
      fabIcon = Icons.check;
      isBottomSheetShown = true;
    }
    emit(ChangeSendIcon());
  }

  void sendRequest(String id) async {
    emit(SendRequestLoading());
    try {
      final response = await apiHelper.post(
        EndPoints.sendRequest,
        data: {'id': id},
      );
      emit(SendRequestSuccess(
          sendCareRequest: SendCareRequest.fromJson(response.data)));
    } on ServerException catch (e) {
      emit(SendRequestError(error: e.errorModel.message));
    }
  }

  // 1 good
  Timer? _timer;
  GetPatients? getAllPatients;
  void getPatients() async {
    // _timer?.cancel();
    // emit(GetPatientsLoading());
    // _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) async {
    //   try {
    //     final response = await apiHelper.get(
    //       EndPoints.getPatients,
    //     );
    //     getAllPatients = GetPatients.fromJson(response);
    //     print(response);
    //     emit(GetPatientsSuccess());
    //   } on ServerException catch (e) {
    //     emit(GetPatientsError(error: e.errorModel.message));
    //   }
    // });
    emit(GetPatientsLoading());
    try {
      final response = await apiHelper.get(
        EndPoints.getPatients,
      );
      getAllPatients = GetPatients.fromJson(response);
      print(response);
      emit(GetPatientsSuccess());
    } on ServerException catch (e) {
      emit(GetPatientsError(error: e.errorModel.message));
    }
  }

  void refreshPatientsData(RefreshController refreshController) async{
    getPatients();
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
