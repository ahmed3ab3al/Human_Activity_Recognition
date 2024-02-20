import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final ImageProvider<Object> image;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorManager.greyColorD9D9D9)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            60.horizontalSpace,
            Image(
              image: image,
              width: 30.w,
              height: 30.h,
            ),
            30.horizontalSpace,
            Text(text, style: Styles.size16_700Black),
          ],
        ),
      ),
    );
  }
}
