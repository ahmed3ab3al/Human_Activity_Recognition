import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class CustomBlueButton extends StatelessWidget {
  final String text;
  final double containerHeight;
  final GestureTapCallback ontap;
  final double? width;

  const CustomBlueButton({
    super.key,
    required this.text,
    required this.ontap,
    required this.containerHeight, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: containerHeight.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff0E4CA1),
              Color(0xff67A3F4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Styles.size16_700White,
            ),
          ],
        ),
      ),
    );
  }
}
