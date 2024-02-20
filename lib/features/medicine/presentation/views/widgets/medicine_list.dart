import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/assets.dart';

import '../../../../../core/utils/colors.dart';


class MedicineList extends StatelessWidget {
   MedicineList({super.key});

 final List<String> images=[
   AppAssets.vitamin,
   AppAssets.trioClar,
   AppAssets.vitaminC,
   AppAssets.injection,
 ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              Container(
                padding: const EdgeInsets.all(5),
                width: 50.w,
                decoration: BoxDecoration(
                  color:ColorManager.whiteColor,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color:  ColorManager.greyColorEEEEEE,
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
                child:Image(
                  image:  AssetImage(images[index]),
                  width: 30.w,
                  height: 30.h,
                ),
                    ),
          separatorBuilder: (context, index) => 42.horizontalSpace,
          itemCount: images.length),
    );
  }
}
