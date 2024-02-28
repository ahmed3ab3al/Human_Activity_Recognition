import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../dangerous/presentation/views/widgets/dangerous_view_body.dart';
import '../../../../medicine/presentation/views/widgets/mentor_medicine_view_body.dart';
import 'mentor_nav_states.dart';


class MentorBottomCubit extends Cubit<MentorBottomNavBarStates> {
  MentorBottomCubit() : super(BottomInitialStates());

  static MentorBottomCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> activeBottomItems =
  [
    Icon(Icons.medication_rounded, color:ColorManager.whiteColor,size: 24.sp,),
    Icon(Icons.location_on_outlined, color: ColorManager.whiteColor,size: 24.sp,),
    Icon(Icons.warning_amber_rounded, color:ColorManager.whiteColor,size: 24.sp,),
    Icon(Icons.chat_bubble, color: ColorManager.whiteColor,size: 24.sp,),
  ];
  List<Widget> inActiveBottomItems=
  [
    Icon(Icons.medication_rounded, color: ColorManager.greyColor757474,size: 24.sp,),
    Icon(Icons.location_on_outlined, color: ColorManager.greyColor757474,size: 24.sp,),
    Icon(Icons.warning_amber_rounded, color: ColorManager.greyColor757474,size: 24.sp,),
    Icon(Icons.chat_bubble, color: ColorManager.greyColor757474,size: 24.sp,),
  ];

  List<Widget> screens = [
    const MentorMedicineViewBody(),
    const DangerousActivityViewBody(),
    const MentorMedicineViewBody(),
    const DangerousActivityViewBody(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarStates());
  }
}
