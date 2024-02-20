import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../dangerous/presentation/views/widgets/dangerous_view_body.dart';
import '../../../medicine/presentation/views/widgets/custom_floating_button.dart';
import '../../../medicine/presentation/views/widgets/mentor_medicine_view_body.dart';

class PatientDetailsView extends StatefulWidget {
  const PatientDetailsView({super.key});

  @override
  State<PatientDetailsView> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<PatientDetailsView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const MentorMedicineViewBody(),
    const DangerousActivityViewBody(),
    const MentorMedicineViewBody(),
    const DangerousActivityViewBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CircleNavBar(
        activeIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        activeIcons:  [
          Icon(Icons.medication_rounded, color:ColorManager.whiteColor,size: 24.sp,),
          Icon(Icons.location_on_outlined, color: ColorManager.whiteColor,size: 24.sp,),
          Icon(Icons.warning_amber_rounded, color:ColorManager.whiteColor,size: 24.sp,),
          Icon(Icons.chat_bubble, color: ColorManager.whiteColor,size: 24.sp,),
        ],
        inactiveIcons:  [
          Icon(Icons.medication_rounded, color: ColorManager.greyColor757474,size: 24.sp,),
          Icon(Icons.location_on_outlined, color: ColorManager.greyColor757474,size: 24.sp,),
          Icon(Icons.warning_amber_rounded, color: ColorManager.greyColor757474,size: 24.sp,),
          Icon(Icons.chat_bubble, color: ColorManager.greyColor757474,size: 24.sp,),
        ],
        color: const Color(0xffF9F9F9),
        height: 60,
        circleWidth: 45,
        circleGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff0E4CA1),
            Color(0xff67A3F4),
          ],
        ),
      ),
      floatingActionButton:
      currentIndex == 0 ?
      CustomFloatingActionButton(
        tab: (){
          GoRouter.of(context).push(AppRouter.kAddMedicine);
        },
        icon: Icons.add,
      ) :
      Container(),
    );
  }
}