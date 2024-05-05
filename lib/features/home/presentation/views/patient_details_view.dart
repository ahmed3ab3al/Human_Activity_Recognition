import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../medicine/presentation/views/widgets/custom_floating_button.dart';
import '../view_models/mentor_cubit/mentor_cubit.dart';
import '../view_models/mentor_cubit/mentor_states.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit, MentorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: MentorCubit.get(context)
              .screens[MentorCubit.get(context).currentIndex],
          bottomNavigationBar: CircleNavBar(
            activeIndex: MentorCubit.get(context).currentIndex,
            onTap: (index) {
              MentorCubit.get(context).changeBottomNavBar(index);
            },
            activeIcons: MentorCubit.get(context).activeBottomItems,
            inactiveIcons: MentorCubit.get(context).inActiveBottomItems,
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
          floatingActionButton: MentorCubit.get(context).currentIndex == 0
              ? CustomFloatingActionButton(
                  tab: () {
                    GoRouter.of(context).push(AppRouter.kAddMedicine);
                  },
                  icon: Icons.add,
                )
              : Container(),
        );
      },
    );
  }
}
