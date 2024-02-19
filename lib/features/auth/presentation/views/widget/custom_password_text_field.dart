import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_icon.dart';

class CustomPasswordTextFormFiled extends StatefulWidget {
  final String hint;
  final TextEditingController customController;
  const CustomPasswordTextFormFiled(
      {super.key, required this.hint, required this.customController});
  @override
  State<CustomPasswordTextFormFiled> createState() {
    return _CustomPasswordTextFiledState();
  }
}

class _CustomPasswordTextFiledState extends State<CustomPasswordTextFormFiled> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.blackColor,
      validator: (value) {
        if (value!.isEmpty) {
          return " Incorrect ${widget.hint}";
        }
        return null;
      },
      controller: widget.customController,
      obscureText: secure,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.greyColorEEEEEE,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.greyColorD9D9D9)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.redColorDC2222)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorManager.greyColorD9D9D9)),
        hintText: 'Enter Your ${widget.hint}',
        hintStyle: Styles.size15_400Grey757474,
        errorStyle: Styles.size14_400RedDC2222,
        prefixIcon: const CustomIcon(icon: Icons.lock_outline_rounded),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? const Color(0xff00B0FF)
                : const Color(0xff757474)),
        suffixIcon: IconButton(
          onPressed: () {
            secure = !secure;
            setState(() {});
          },
          icon: Icon(
            secure ? Icons.visibility_off : Icons.visibility,
            color: ColorManager.greyColor757474,
            size: 25.sp,
          ),
        ),
      ),
    );
  }
}
