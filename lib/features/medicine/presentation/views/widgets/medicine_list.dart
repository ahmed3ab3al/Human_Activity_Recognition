import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/medicine_cubit/medicine_cubit.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/medicine_cubit/medicine_state.dart';

import '../../../../../core/utils/colors.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  static const List<String> images = [
    AppAssets.vitamin,
    AppAssets.trioClar,
    AppAssets.vitaminC,
    AppAssets.injection,
  ];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineStates>(
      builder: (context, state) {
        return SizedBox(
          height: 55.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () {
                      MedicineCubit.get(context).changeDragItem(index);
                    },
                    child: Stack(children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 50.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: ColorManager.whiteColor,
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: ColorManager.greyColorEEEEEE,
                            width: 1.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(
                                1,
                                2,
                              ),
                            ),
                          ],
                        ),
                        child: Image(
                          image: AssetImage(images[index]),
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                      MedicineCubit.get(context).selectedItem == index
                          ? Positioned(
                        bottom: 40.h,
                        left: 35.w,
                        child: CircleAvatar(
                          radius: 7.r,
                          backgroundColor: Colors.greenAccent,
                          child: Icon(
                            Icons.check,
                            size: 14.w,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : Container(),
                    ]),
                  ),
              separatorBuilder: (context, index) => 42.horizontalSpace,
              itemCount: images.length),
        );
      },
    );
  }
}

