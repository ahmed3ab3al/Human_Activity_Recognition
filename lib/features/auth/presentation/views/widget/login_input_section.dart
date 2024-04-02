import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/auth/presentation/view_models/cubit.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_models/states.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection({super.key, required this.loginEmailController, required this.loginPasswordController});

  final TextEditingController loginEmailController ;
  final TextEditingController loginPasswordController ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthCubit, AuthStates>(
      builder: (context, state) {
    return Column(
      children: [
        CustomTextFormFiled(
          hint: 'Email',
          customController: loginEmailController,
          type: TextInputType.emailAddress,
          prefix: Icons.email_outlined,
        ),
        24.verticalSpace,
        CustomTextFormFiled(
          hint: 'Password',
          secure: AppAuthCubit.get(context).secure,
          customController: loginPasswordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              AppAuthCubit.get(context).changeSecure();
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
  },
);
  }
}

