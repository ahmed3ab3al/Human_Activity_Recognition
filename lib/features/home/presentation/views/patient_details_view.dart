import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../medicine/presentation/view_models/medicine_cubit/medicine_cubit.dart';
import '../../../medicine/presentation/views/widgets/custom_floating_button.dart';
import '../view_models/mentor_cubit/mentor_cubit.dart';
import '../view_models/mentor_cubit/mentor_states.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key, required this.name});
  final name;
  @override
  Widget build(BuildContext context) {
    MedicineCubit.get(context).getPatientsMedicine(patientID: patientID);
    ChatCubit.get(context).getChat(back: true);
    return BlocConsumer<MentorCubit, MentorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: MentorCubit.get(context)
              .screens[MentorCubit.get(context).currentIndex],
          bottomNavigationBar: CircleNavBar(
            activeIndex: MentorCubit.get(context).currentIndex,
            onTap: (index) {
              if (index == 2) {
                GoRouter.of(context).push(
                  AppRouter.kChatDetails,
                  extra: name,
                );
              }
              MentorCubit.get(context).changeBottomNavBar(index);
            },
            activeIcons: MentorCubit.get(context).activeBottomItems,
            inactiveIcons: MentorCubit.get(context).inActiveBottomItems,
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
