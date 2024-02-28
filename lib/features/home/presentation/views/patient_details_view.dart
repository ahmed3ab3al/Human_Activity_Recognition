import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../medicine/presentation/views/widgets/custom_floating_button.dart';
import '../manager/mentor_nav_bar/mentor_nav_cubit.dart';
import '../manager/mentor_nav_bar/mentor_nav_states.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MentorBottomCubit(),
      child: BlocConsumer<MentorBottomCubit, MentorBottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
    return Scaffold(
      body: MentorBottomCubit.get(context)
          .screens[MentorBottomCubit.get(context).currentIndex],
      bottomNavigationBar: CircleNavBar(
        activeIndex: MentorBottomCubit.get(context).currentIndex,
        onTap: (index) {
          MentorBottomCubit.get(context).changeBottomNavBar(index);
        },
        activeIcons: MentorBottomCubit.get(context).activeBottomItems,
        inactiveIcons:
        MentorBottomCubit.get(context).inActiveBottomItems,
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
      MentorBottomCubit.get(context).currentIndex == 0 ?
      CustomFloatingActionButton(
        tab: (){
          GoRouter.of(context).push(AppRouter.kAddMedicine);
        },
        icon: Icons.add,
      ) :
      Container(),
    );
  },
  ),
  );
  }
}