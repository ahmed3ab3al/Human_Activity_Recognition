import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_textFormField.dart';

class LoginInputSection extends StatefulWidget {
  const LoginInputSection({super.key});

  @override
  State<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends State<LoginInputSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTextFormFiled(
          hint: 'Email',
          customController: emailController,
          type: TextInputType.emailAddress,
          prefix: Icons.email_outlined,
        ),
        24.verticalSpace,
        CustomTextFormFiled(
          hint: 'Password',
          secure: secure,
          customController: passwordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
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
        3.verticalSpace,
      ],
    );
  }
}
