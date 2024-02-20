import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r),),
      activeColor: ColorManager.whiteColor,
      side:  const BorderSide(color: ColorManager.greyColorD9D9D9),
      checkColor: Colors.blueAccent,
      fillColor: MaterialStateProperty.resolveWith(
          (states) => const Color(0xffFFFFFF)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
