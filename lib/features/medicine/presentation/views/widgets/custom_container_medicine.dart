import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

// ignore: must_be_immutable
class CustomContainerMedicine extends StatelessWidget {
  const CustomContainerMedicine(
      {super.key,
      required this.name,
      required this.dosage,
      required this.shape});

  static const List<String> images = [
    AppAssets.vitamin,
    AppAssets.trioClar,
    AppAssets.vitaminC,
    AppAssets.injection,
  ];
  final name;
  final dosage;
  final shape;
  @override
  Widget build(BuildContext context) {
    int num = 0;
    if (shape == 'drink') {
      num = 0;
    } else if (shape == 'pill') {
      num = 1;
    } else if (shape == 'rivet') {
      num = 2;
    } else {
      num = 3;
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: ColorManager.greyColorEEEEEE,
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(.3),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                    image: AssetImage(images[num]),
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.size16_700Black,
                      ),
                      12.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              maxLines: 2,
                              "${dosage} dosing once per day ",
                              style: Styles.size12_400Grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
