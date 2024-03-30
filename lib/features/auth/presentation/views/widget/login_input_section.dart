import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/auth/manager/cubit.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginInputSection extends StatefulWidget {
  const LoginInputSection({super.key});

  @override
  State<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends State<LoginInputSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiled(
          hint: 'Email',
          customController: AppAuthCubit.get(context).loginEmailController,
          type: TextInputType.emailAddress,
          prefix: Icons.email_outlined,
        ),
        24.verticalSpace,
        CustomTextFormFiled(
          hint: 'Password',
          secure: AppAuthCubit.get(context).secure,
          customController: AppAuthCubit.get(context).loginPasswordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              AppAuthCubit.get(context).secure =
                  !AppAuthCubit.get(context).secure;
              setState(() {});
            },
            icon: Icon(
              AppAuthCubit.get(context).secure
                  ? Icons.visibility_off
                  : Icons.visibility,
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
