import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final double space;
  final VoidCallback tab;
  const CustomAppBar({
    super.key,
    required this.text, required this.space, required this.tab,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        25.horizontalSpace,
        IconButton(
          onPressed:tab,
          icon:  Icon(
            Icons.arrow_back_ios_outlined,
            size: 17.sp,
            color:  ColorManager.blackColor,
          ),
        ),
        space.horizontalSpace,
        Text(
          text,
          style: Styles.size16_700Black,
        ),
      ],
    );
  }
}
