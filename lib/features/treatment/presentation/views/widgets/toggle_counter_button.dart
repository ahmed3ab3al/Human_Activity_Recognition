import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';

class GestureDetectorToggleCounter extends StatefulWidget {
  const GestureDetectorToggleCounter({super.key});

  @override
  State<GestureDetectorToggleCounter> createState() =>
      _GestureDetectorToggleState();
}

class _GestureDetectorToggleState extends State<GestureDetectorToggleCounter> {
  bool isFirstContainerSelected = false;

  void toggleContainer() {
    setState(() {
      isFirstContainerSelected = !isFirstContainerSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap:isFirstContainerSelected ? toggleContainer : null,
          child: Container(
            // width: 20.w,
            // height: 20.h,
            decoration: BoxDecoration(
                gradient: isFirstContainerSelected
                    ? const LinearGradient(
                    colors: [
                     ColorManager.greyColorD9D9D9,
                     ColorManager.greyColorD9D9D9,
                    ]
                )
                    : const LinearGradient(
                  colors: [
                    Color(0xff0E4CA1),
                    Color(0xff67A3F4),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(5.r)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.plus_one_outlined,
                    size: 20.sp,
                  color: ColorManager.whiteColor,
                ),
              ],
            )

          ),
        ),
        10.horizontalSpace,
        const Text('1 time'),
        10.horizontalSpace,
        GestureDetector(
          onTap: isFirstContainerSelected ? null : toggleContainer,
          child: Container(
              // width: 20.w,
              // height: 20.h,
              decoration: BoxDecoration(
                  gradient: isFirstContainerSelected
                      ? const LinearGradient(
                    colors: [
                      Color(0xff0E4CA1),
                      Color(0xff67A3F4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                      : const LinearGradient(
                      colors: [
                        ColorManager.greyColorD9D9D9,
                        ColorManager.greyColorD9D9D9,
                      ]
                  ),
                  borderRadius: BorderRadius.circular(5.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exposure_minus_1_outlined,
                    size: 20.sp,
                    color: ColorManager.whiteColor,
                  ),
                ],
              )
          ),
        ),
      ],
    );
  }
}
