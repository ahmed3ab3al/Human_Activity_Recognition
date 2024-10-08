import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/home/presentation/view_models/mentor_cubit/mentor_cubit.dart';
import 'package:graduation_project/features/home/presentation/view_models/mentor_cubit/mentor_states.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/patient_list_item.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_loading_item.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MentorCubit.get(context);
    return BlocBuilder<MentorCubit, MentorStates>(
      builder: (context, state) {
        if (state is GetPatientsLoading) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  const CustomLoadingItem(
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 18,
                  ),
                  Column(
                    children: [
                      CustomLoadingItem(
                        width: MediaQuery.sizeOf(context).width / 2.5,
                        height: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomLoadingItem(
                        width: MediaQuery.sizeOf(context).width / 2.5,
                        height: 20,
                      )
                    ],
                  ),
                ],
              );
            },
          );
        } else if (state is GetPatientsError) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: MediaQuery.of(context).size.height / 3),
            child: Text(
              state.error,
              textAlign: TextAlign.center,
              style: Styles.size24_700Black,
            ),
          );
        } else {
          if (MentorCubit.get(context).getAllPatients!.result!.isNotEmpty) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemCount: cubit.getAllPatients!.result!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kPatientDetails,
                        extra:
                            cubit.getAllPatients!.result![index].patient!.name,
                      );
                    },
                    child: PatientListItem(
                      name: cubit.getAllPatients!.result![index].patient!.name!,
                      id: cubit.getAllPatients!.result![index].patient!.id,
                      activitiy: cubit.getAllPatients!.result![index].type,
                    ));
              },
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2.9,
                ),
                Text(
                  'PLease Add Patient',
                  textAlign: TextAlign.center,
                  style: Styles.size24_700Black.copyWith(fontSize: 15),
                ),
              ],
            );
          }
        }
      },
    );
  }
}
