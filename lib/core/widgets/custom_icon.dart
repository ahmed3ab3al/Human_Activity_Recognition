import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final IconData icon;
  const CustomIcon({super.key, required this.icon});

  @override
  State<CustomIcon> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CustomIcon> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.h, right: 12.w, left: 12.w),
      child: GradientIcon(
        size: 22.sp,
        icon: widget.icon,
        gradient: const LinearGradient(
          colors: [
            Color(0xff0E4CA1),
            Color(0xff67A3F4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
