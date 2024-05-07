import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/home/presentation/view_models/mentor_cubit/mentor_cubit.dart';
import 'package:graduation_project/features/home/presentation/view_models/mentor_cubit/mentor_states.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/patient_list_item.dart';

import '../../../../../core/utils/app_router.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MentorCubit.get(context);
    return BlocBuilder<MentorCubit, MentorStates>(
      builder: (context, state) {
        if (state is GetPatientsLoading) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 3,
              ),
              const CircularProgressIndicator(),
            ],
          );
        } else if (state is GetPatientsError)
          {
            return Center(
              child: Text(
                state.error,
                style: Styles.size24_700Black,
              ),
            );
          }
        else
          {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context,
                  index,) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemCount: cubit.getAllPatients!.result!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kPatientDetails);
                    },
                    child:  PatientListItem(
                      name: cubit.getAllPatients!.result![index].patient!.name!,
                      id: cubit.getAllPatients!.result![index].patient!.id,
                      activitiy: cubit.getAllPatients!.result![index].type,
                    )
                );
              },
            );
          }
      },
    );
  }
}
