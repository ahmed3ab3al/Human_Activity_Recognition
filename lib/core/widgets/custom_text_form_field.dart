import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_icon.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextInputType? type;
  final IconData? prefix;
  final String? hint;
  final TextEditingController? customController;
  final bool? secure;
  final Widget? suffixIcon;

  const CustomTextFormFiled({
    super.key,
    this.hint,
    this.customController,
    this.type,
    this.prefix,
    this.secure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.blueColor0E4CA1,
      validator: (value) {
        if (value!.isEmpty) {
          return "Incorrect $hint";
        }
        return null;
      },
      controller: customController,
      keyboardType: type,
      obscureText: secure ?? false,
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
            color: ColorManager.blueColor0E4CA1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.greyColorD9D9D9)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.redColorDC2222)),
        hintText: 'Enter Your $hint',
        hintStyle:
            Styles.testStyle15.copyWith(color: ColorManager.greyColor757474),
        errorStyle:
            Styles.testStyle14.copyWith(color: ColorManager.redColorDC2222),
        suffixIcon: suffixIcon,
        prefixIcon: prefix == null
            ? null
            : CustomIcon(
                icon: prefix!,
              ),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? const Color(0xff00B0FF)
                : const Color(0xff757474)),
      ),
    );
  }
}
