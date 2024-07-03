import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/features/home/presentation/view_models/patient_cubit/patient_cubit.dart';
import 'package:graduation_project/features/home/presentation/view_models/patient_cubit/patient_states.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/mentor_requesr_loading.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/line_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../constants.dart';
import '../../../../core/utils/colors.dart';
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
                              itemBuilder: (context, index) => buildMentorItem(
                                  name: PatientCubit.get(context)
                                      .getMentorRequest!
                                      .result![index]
                                      .mentor!
                                      .name!,
                                  id: PatientCubit.get(context)
                                      .getMentorRequest!
                                      .result![index]
                                      .id!,
                                  context: context),
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

Widget buildMentorItem({
  required String id,
  required String name,
  context,
}) =>
    Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 25,
            ),
            CircleAvatar(
              radius: 30.r,
              backgroundImage:  AssetImage(anotherImage),
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 15,
            ),
            Flexible(
              flex: 100,
              child: Text(
                name,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 6,
            ),
            GestureDetector(
              onTap: () {
                PatientCubit.get(context).confirmRequest(id);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff0E4CA1),
                      Color(0xff67A3F4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.check,
                  size: 20.sp,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 15,
            ),
            GestureDetector(
              onTap: () {
                PatientCubit.get(context).declineRequest(id);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0E4CA1),
                        Color(0xff67A3F4),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.circle),
                child: Icon(
                  FontAwesomeIcons.xmark,
                  color: ColorManager.whiteColor,
                  size: 20.sp,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 20,
            ),
          ],
        ),
        15.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: const LineContainer(),
        ),
      ],
    );
