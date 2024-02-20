import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_textFormField.dart';

class SignUpInputSection extends StatefulWidget {
  const SignUpInputSection({super.key});

  @override
  State<SignUpInputSection> createState() => _SignUpInputSectionState();
}

class _SignUpInputSectionState extends State<SignUpInputSection> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool secure1 = true;
  bool secure2 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiled(
          hint: 'Name ',
          customController: nameController,
          type: TextInputType.name,
          prefix:Icons.person_outline_rounded,
        ),
        25.verticalSpace,
        CustomTextFormFiled(
            hint: 'Number',
            customController: phoneController,
            type: TextInputType.phone,
            prefix:Icons.phone),
        25.verticalSpace,
        CustomTextFormFiled(
          hint: 'Email ',
          customController: emailController,
          type: TextInputType.emailAddress,
          prefix:Icons.email_outlined,
        ),
        25.verticalSpace,
        CustomTextFormFiled(
          hint: 'Password',
          secure: secure1,
          customController: passwordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              secure1 = !secure1;
              setState(() {});
            },
            icon: Icon(
              secure1 ? Icons.visibility_off : Icons.visibility,
              color: ColorManager.greyColor757474,
              size: 25.sp,
            ),
          ),
        ),
        25.verticalSpace,
        CustomTextFormFiled(
          hint: 'Confirmation Password',
          secure: secure2,
          customController: confirmPasswordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              secure2 = !secure2;
              setState(() {});
            },
            icon: Icon(
              secure2 ? Icons.visibility_off : Icons.visibility,
              color: ColorManager.greyColor757474,
              size: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}
