import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../view_models/medicine_cubit/medicine_cubit.dart';
import '../../view_models/medicine_cubit/medicine_state.dart';

class GestureDetectorToggleCounter extends StatelessWidget {
  const GestureDetectorToggleCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineStates>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
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
                  BlocProvider.of<MedicineCubit>(context).plus();
                },
                child: Icon(
                  Icons.plus_one_outlined,
                  color: ColorManager.whiteColor,
                  size: 20.sp,
                ),
              ),
            ),
            10.horizontalSpace,
            Text(BlocProvider.of<MedicineCubit>(context).dosage.toString()),
            10.horizontalSpace,
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    ColorManager.greyColorD9D9D9,
                    ColorManager.greyColorD9D9D9,
                  ]),
                  borderRadius: BorderRadius.circular(5.r)),
              child: InkWell(
                onTap: () {
                  BlocProvider.of<MedicineCubit>(context).minus();
                },
                child: Icon(
                  Icons.exposure_minus_1_outlined,
                  color: ColorManager.whiteColor,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
