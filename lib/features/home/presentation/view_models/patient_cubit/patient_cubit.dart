import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/view_models/patient_cubit/patient_states.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/api/api_helper.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/colors.dart';
import '../../../data/models/GetMentorRequests.dart';
import '../../../../chat/presentation/views/patients_chats_body.dart';
import '../../views/mentors_body.dart';
import '../../../../medicine/presentation/views/patient_medicine_view.dart';

class PatientCubit extends Cubit<PatientStates> {
  PatientCubit(this.apiHelper) : super(BottomInitialStates());

  final ApiHelper apiHelper;
  static PatientCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> activeBottomItems = [
    Icon(
      Icons.medication_rounded,
      color: ColorManager.whiteColor,
      size: 24.sp,
    ),
    Icon(
      Icons.chat_bubble,
      color: ColorManager.whiteColor,
      size: 24.sp,
    ),
    Icon(
      Icons.people_alt_outlined,
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
      Icons.chat_bubble,
      color: ColorManager.blackColor,
      size: 24.sp,
    ),
    Icon(
      Icons.people_alt_outlined,
      color: ColorManager.greyColor757474,
      size: 24.sp,
    ),
  ];

  List<Widget> screens = [
    const PatientMedicineView(),
    ChatsScreen(),
    const MentorsBody(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarStates());
  }

  GetMentorRequests? getMentorRequest;
  bool getMentorRequestDone = true;
  void getMentorRequests() async {
    emit(GetMentorRequestsLoading());
    try {
      final response = await apiHelper.get(
        EndPoints.getMentorRequest,
      );
      getMentorRequest = GetMentorRequests.fromJson(response);
      emit(GetMentorRequestsSuccess());
      getMentorRequestDone = false;
    } on ServerException catch (e) {
      emit(GetMentorRequestsError(error: e.errorModel.message));
    }
  }

  void confirmRequest(String id) async {
    emit(ConfirmRequestLoading());
    try {
      await apiHelper.post('${EndPoints.confirmRequest}$id');
      emit(ConfirmRequestSuccess());
      getMentorRequests();
    } on ServerException catch (e) {
      emit(ConfirmRequestError(error: e.errorModel.message));
    }
  }

  void declineRequest(String id) async {
    emit(DeclineRequestLoading());
    try {
      await apiHelper.patch('${EndPoints.declineRequest}$id');
      emit(DeclineRequestSuccess());
      getMentorRequests();
    } on ServerException catch (e) {
      emit(DeclineRequestError(error: e.errorModel.message));
    }
  }

  void refreshPatientsMedicine(RefreshController refreshController) async{
    getMentorRequests();
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
