import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';

class PatientListItem extends StatelessWidget {
  const PatientListItem(
      {required this.name,
      super.key,
      required this.activitiy,
      required this.id});
  final name;
  final activitiy;
  final id;
  @override
  Widget build(BuildContext context) {
    patientID = id;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
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
      child: Row(
        children: [
          Image(
            image: AssetImage(
              activityPhoto[activitiy] ?? AppAssets.error,
            ),
            width: 50.w,
            height: 70.h,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.size16_400Black
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                4.verticalSpace,
                Text(
                  activitiy ?? 'Un Known Activity',
                  style: Styles.testStyle14.copyWith(
                      color: activitiy == 'Fall'
                          ? ColorManager.redColorDC2222
                          : ColorManager.greyColor757474),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
