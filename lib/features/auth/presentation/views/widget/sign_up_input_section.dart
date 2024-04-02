import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_models/cubit.dart';
import '../../view_models/states.dart';


class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection({super.key, required this.signUpPasswordController, required this.signUpConfirmPasswordController, required this.signUpNameController, required this.signUpPhoneController, required this.signUpEmailController});

  final TextEditingController signUpPasswordController ;
  final TextEditingController signUpConfirmPasswordController;
  final TextEditingController signUpNameController ;
  final TextEditingController signUpPhoneController ;
  final TextEditingController signUpEmailController ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthCubit, AuthStates>(
  builder: (context, state) {
    return Column(
      children: [
        CustomTextFormFiled(
          hint: 'Name ',
          customController: signUpNameController,
          type: TextInputType.name,
          prefix: Icons.person_outline_rounded,
        ),
        25.verticalSpace,
        CustomTextFormFiled(
            hint: 'Number',
            customController: signUpPhoneController,
            type: TextInputType.phone,
            prefix: Icons.phone),
        25.verticalSpace,
        CustomTextFormFiled(
          hint: 'Email ',
          customController: signUpEmailController,
          type: TextInputType.emailAddress,
          prefix: Icons.email_outlined,
        ),
        25.verticalSpace,
        CustomTextFormFiled(
          hint: 'Password',
          secure: AppAuthCubit.get(context).secure,
          customController:signUpPasswordController,
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
        25.verticalSpace,
        CustomTextFormFiled(
          hint: 'Confirmation Password',
          secure: AppAuthCubit.get(context).secure,
          customController:
          signUpConfirmPasswordController,
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
        25.verticalSpace,
        DropdownButton(
            icon: const Icon(Icons.arrow_drop_down_circle_rounded,
                size: 25, color: Color(0xcb094fde)),
            value: AppAuthCubit.get(context).selectedValue,
            items: AppAuthCubit.get(context).genderItems.map((element) {
              return DropdownMenuItem(
                value: element,
                child: Text(
                  element.toString(),
                ),
              );
            }).toList(),
            onChanged: (dynamic value) {
              AppAuthCubit.get(context).changeGender(value);
            }),
      ],
    );
  },
);
  }
}

