import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/assets.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({super.key, required this.tab});
final GestureTapCallback tab;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: tab,
      child: Container(
          padding:  EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color:ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: ColorManager.greyColorEEEEEE,
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(
                  0,
                  4,
                ),
              ),
            ],
          ),
          child:  Row(
            children: [
              Image(image: const AssetImage(AppAssets.upStair),width: 50.w,height: 70.h,),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  top: 10.h,
                  bottom: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dev/Ahmed Alaa ",
                    ),
                    4.verticalSpace,
                    const Text(
                      "Up Stairs",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
