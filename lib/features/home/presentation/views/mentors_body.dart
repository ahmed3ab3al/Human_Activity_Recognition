import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/view_models/patient_cubit/patient_cubit.dart';
import 'package:graduation_project/features/home/presentation/view_models/patient_cubit/patient_states.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/mentor_item.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/mentor_requesr_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/utils/styles.dart';

class MentorsBody extends StatelessWidget {
  const MentorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    if (PatientCubit.get(context).getMentorRequest == null) {
      PatientCubit.get(context).getMentorRequests();
    }
    RefreshController refreshController =
        RefreshController(initialRefresh: false);
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {
        if (state is ConfirmRequestSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Confirm Success")),
            ),
          );
        } else if (state is ConfirmRequestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.error)),
            ),
          );
        } else if (state is DeclineRequestSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Decline Success")),
            ),
          );
        } else if (state is DeclineRequestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.error)),
            ),
          );
        }
      },
      builder: (context, state) {
        return SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          onRefresh: () async {
            PatientCubit.get(context)
                .refreshPatientsMedicine(refreshController);
          },
          child: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Mentors',
                        style: Styles.size16_700Black,
                      )
                    ],
                  ),
                  30.verticalSpace,
                  PatientCubit.get(context).getMentorRequestDone ||
                          state is GetMentorRequestsLoading
                      ? const MentorRequestLoading()
                      : PatientCubit.get(context)
                              .getMentorRequest!
                              .result!
                              .isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (context, index) => MentorItem(
                                name: PatientCubit.get(context)
                                    .getMentorRequest!
                                    .result![index]
                                    .mentor!
                                    .name!,
                                id: PatientCubit.get(context)
                                    .getMentorRequest!
                                    .result![index]
                                    .id!,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  10.verticalSpace,
                              itemCount: PatientCubit.get(context)
                                  .getMentorRequest!
                                  .result!
                                  .length,
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height / 2.5),
                              child: Text(
                                "Not Requests Yet",
                                style: Styles.size16_700Black,
                              ),
                            ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
