import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class GestureDetectorToggle extends StatefulWidget {
  const GestureDetectorToggle({super.key});

  @override
  State<GestureDetectorToggle> createState() => _GestureDetectorToggleState();
}

class _GestureDetectorToggleState extends State<GestureDetectorToggle> {
  bool isFirstContainerSelected = false;

  void toggleContainer() {
    setState(() {
      isFirstContainerSelected = !isFirstContainerSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: isFirstContainerSelected ? toggleContainer : null,
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                    gradient: isFirstContainerSelected
                        ? null
                        : const LinearGradient(
                            colors: [
                              Color(0xff0E4CA1),
                              Color(0xff67A3F4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Before Meals',
                      style: isFirstContainerSelected
                          ? Styles.size16_700Black
                          : Styles.size16_700White,
                    ),
                  ],
                ),
              ),
            ),
          ),
          5.horizontalSpace,
          Expanded(
            child: GestureDetector(
              onTap: isFirstContainerSelected ? null : toggleContainer,
              child: Container(
                  width: double.infinity,
                  height: 50.h,
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
                          : null,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('After Meals',
                          style: isFirstContainerSelected
                              ? Styles.size16_700White
                              : Styles.size16_700Black),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
