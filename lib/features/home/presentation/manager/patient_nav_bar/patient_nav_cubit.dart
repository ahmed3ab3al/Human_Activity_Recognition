import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/manager/patient_nav_bar/patient_nav_states.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../followee_chats_body.dart';
import '../../../../../mentors_body.dart';
import '../../../../medicine/presentation/views/patient_medicine_view.dart';


class PatientBottomCubit extends Cubit<PatientBottomNavBarStates> {
  PatientBottomCubit() : super(BottomInitialStates());

  static PatientBottomCubit get(context) => BlocProvider.of(context);

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
