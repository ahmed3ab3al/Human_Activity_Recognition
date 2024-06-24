import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/colors.dart';
import 'package:graduation_project/core/utils/sensors.dart';
import '../../../../constants.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/utils/location.dart';
import '../../../medicine/presentation/view_models/medicine_cubit/medicine_cubit.dart';
import '../view_models/patient_cubit/patient_cubit.dart';
import '../view_models/patient_cubit/patient_states.dart';

class PatientView extends StatelessWidget {
  const PatientView({super.key});

  @override
  Widget build(BuildContext context) {
    sensor(
      context: context
    );
    // startSendingData();
    // startSendingLocation();
    if (MedicineCubit.get(context).getPatientMedicine == null){
      MedicineCubit.get(context).getPatientsMedicine(patientID: CacheHelper().getData(key: userId));
    }
    if (PatientCubit.get(context).getMentorRequest == null){
      PatientCubit.get(context).getMentorRequests();
    }
    return BlocConsumer<PatientCubit, PatientStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return Scaffold(
        body:   AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark
          ),
          child: PatientCubit.get(context)
              .screens[PatientCubit.get(context).currentIndex],
        ),
        bottomNavigationBar: CircleNavBar(
          activeIndex: PatientCubit.get(context).currentIndex,
          onTap: (index) {
            PatientCubit.get(context).changeBottomNavBar(index);
          },
          activeIcons: PatientCubit.get(context).activeBottomItems,
          inactiveIcons: PatientCubit.get(context).inActiveBottomItems,
          color: const Color(0xffF9F9F9),
          height: 60,
          shadowColor: ColorManager.blackColor.withOpacity(0.3),
          elevation: 5,
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
      );
    },
        );
  }
}
