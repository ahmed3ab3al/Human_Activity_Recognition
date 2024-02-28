import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/patient_nav_bar/patient_nav_cubit.dart';
import '../manager/patient_nav_bar/patient_nav_states.dart';


class PatientView extends StatelessWidget {
  const PatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientBottomCubit(),
      child: BlocConsumer<PatientBottomCubit, PatientBottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: PatientBottomCubit.get(context)
                .screens[PatientBottomCubit.get(context).currentIndex],
            bottomNavigationBar: CircleNavBar(
              activeIndex: PatientBottomCubit.get(context).currentIndex,
              onTap: (index) {
                PatientBottomCubit.get(context).changeBottomNavBar(index);
              },
              activeIcons: PatientBottomCubit.get(context).activeBottomItems,
              inactiveIcons:
                  PatientBottomCubit.get(context).inActiveBottomItems,
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
      ),
    );
  }
}
