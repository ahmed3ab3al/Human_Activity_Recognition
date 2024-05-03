import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/view_models/patient_cubit/patient_states.dart';

import '../../../../../core/utils/colors.dart';
import '../../views/followee_chats_body.dart';
import '../../views/mentors_body.dart';
import '../../../../medicine/presentation/views/patient_medicine_view.dart';


class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() : super(BottomInitialStates());

  static PatientCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> activeBottomItems =
  [
    Icon(Icons.medication_rounded, color:ColorManager.whiteColor,size: 24.sp,),
    Icon(Icons.chat_bubble, color: ColorManager.whiteColor,size: 24.sp,),
    Icon(Icons.people_alt_outlined, color: ColorManager.whiteColor,size: 24.sp,),
  ];
  List<Widget> inActiveBottomItems=
  [
    Icon(Icons.medication_rounded, color: ColorManager.greyColor757474,size: 24.sp,),
    Icon(Icons.chat_bubble, color: ColorManager.blackColor,size: 24.sp,),
    Icon(Icons.people_alt_outlined, color: ColorManager.greyColor757474,size: 24.sp,),
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
}
