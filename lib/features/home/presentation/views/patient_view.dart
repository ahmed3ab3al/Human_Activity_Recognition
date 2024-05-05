import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/patient_cubit/patient_cubit.dart';
import '../view_models/patient_cubit/patient_states.dart';

class PatientView extends StatelessWidget {
  const PatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PatientCubit.get(context)
              .screens[PatientCubit.get(context).currentIndex],
          bottomNavigationBar: CircleNavBar(
            activeIndex: PatientCubit.get(context).currentIndex,
            onTap: (index) {
              PatientCubit.get(context).changeBottomNavBar(index);
            },
            activeIcons: PatientCubit.get(context).activeBottomItems,
            inactiveIcons: PatientCubit.get(context).inActiveBottomItems,
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
        );
      },
    );
  }
}
