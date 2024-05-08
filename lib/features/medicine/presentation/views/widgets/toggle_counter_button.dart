import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../view_models/mentor_medicine_cubit/mentor_medicine_cubit.dart';
import '../../view_models/mentor_medicine_cubit/mentor_medicine_state.dart';

class GestureDetectorToggleCounter extends StatelessWidget {
  const GestureDetectorToggleCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MentorMedicineCubit, MentorMedicineStates>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ()=> MentorMedicineCubit.get(context).toggleContainer(true),
              child: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                    gradient: BlocProvider.of<MentorMedicineCubit>(context)
                            .isFirstContainerSelected
                        ? const LinearGradient(colors: [
                            ColorManager.greyColorD9D9D9,
                            ColorManager.greyColorD9D9D9,
                          ])
                        : const LinearGradient(
                            colors: [
                              Color(0xff0E4CA1),
                              Color(0xff67A3F4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                    borderRadius: BorderRadius.circular(5.r)),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<MentorMedicineCubit>(context).plus();
                  },
                  child: Icon(
                    Icons.plus_one_outlined,
                    color: ColorManager.whiteColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            Text(BlocProvider.of<MentorMedicineCubit>(context).dosage.toString()),
            10.horizontalSpace,
            GestureDetector(
              onTap: ()=> MentorMedicineCubit.get(context).toggleContainer(false),
              child: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                    gradient: BlocProvider.of<MentorMedicineCubit>(context)
                            .isFirstContainerSelected
                        ? const LinearGradient(
                            colors: [
                              Color(0xff0E4CA1),
                              Color(0xff67A3F4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : const LinearGradient(colors: [
                            ColorManager.greyColorD9D9D9,
                            ColorManager.greyColorD9D9D9,
                          ]),
                    borderRadius: BorderRadius.circular(5.r)),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<MentorMedicineCubit>(context).minus();
                  },
                  child: Icon(
                    Icons.exposure_minus_1_outlined,
                    color: ColorManager.whiteColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
