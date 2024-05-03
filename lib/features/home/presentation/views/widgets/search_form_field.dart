import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/styles.dart';

import '../../../../../core/utils/colors.dart';

class SearchTextFormFiled extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final TextEditingController? customController;

  const SearchTextFormFiled({
    super.key,
    required this.hint,
    required this.customController,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.blackColor,
      validator: (value) {
        if (value!.isEmpty) {
          return "NOT Found";
        }
        return null;
      },
      controller: customController,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.greyColorEEEEEE,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: ColorManager.greyColorD9D9D9,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.greyColorD9D9D9)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.redColorDC2222)),
        hintText: hint,
        hintStyle: Styles.testStyle15.copyWith(color: ColorManager.greyColor757474),
        errorStyle: Styles.testStyle14.copyWith(color: ColorManager.redColorDC2222),
        prefixIcon:const Icon(Icons.search_rounded,) ,
        prefixIconColor: ColorManager.greyColor757474
      ),
    );
  }
}
