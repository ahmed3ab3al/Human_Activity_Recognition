import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageText extends StatelessWidget {
  const ImageText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        12.horizontalSpace,
        const Text('Hello'),
        5.horizontalSpace,
        Image(
          image: const AssetImage('images/wave_hand.png'),
          width: 30.w,
          height: 30.h,
        )
      ],
    );
  }
}
