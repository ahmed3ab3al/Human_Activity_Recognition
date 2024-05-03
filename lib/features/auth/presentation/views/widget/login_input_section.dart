import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';


class LoginInputSection extends StatelessWidget {
  const LoginInputSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
    return Column(
      children: [
        CustomTextFormFiled(
          hint: 'Email',
          customController: LoginCubit.get(context).loginEmailController,
          type: TextInputType.emailAddress,
          prefix: Icons.email_outlined,
        ),
        24.verticalSpace,
        CustomTextFormFiled(
          hint: 'Password',
          secure: LoginCubit.get(context).secure,
          customController: LoginCubit.get(context).loginPasswordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              LoginCubit.get(context).changeSecure();
            },
            icon: Icon(
              LoginCubit.get(context).secure
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

