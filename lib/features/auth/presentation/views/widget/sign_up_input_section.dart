import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_models/Sign_up_cubit/sign_up_cubit.dart';



class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection({super.key, required this.signUpPasswordController, required this.signUpConfirmPasswordController, required this.signUpNameController, required this.signUpPhoneController, required this.signUpEmailController});

  final TextEditingController signUpPasswordController ;
  final TextEditingController signUpConfirmPasswordController;
  final TextEditingController signUpNameController ;
  final TextEditingController signUpPhoneController ;
  final TextEditingController signUpEmailController ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
          secure: SignUpCubit.get(context).secure,
          customController:signUpPasswordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              SignUpCubit.get(context).changeSecure();
            },
            icon: Icon(
              SignUpCubit.get(context).secure
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
          secure: SignUpCubit.get(context).secure,
          customController:
          signUpConfirmPasswordController,
          type: TextInputType.visiblePassword,
          prefix: Icons.lock_outline_rounded,
          suffixIcon: IconButton(
            onPressed: () {
              SignUpCubit.get(context).changeSecure();
            },
            icon: Icon(
              SignUpCubit.get(context).secure
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
            value: SignUpCubit.get(context).selectedValue,
            items: SignUpCubit.get(context).genderItems.map((element) {
              return DropdownMenuItem(
                value: element,
                child: Text(
                  element.toString(),
                ),
              );
            }).toList(),
            onChanged: (dynamic value) {
              SignUpCubit.get(context).changeGender(value);
            }),
      ],
    );
  },
);
  }
}

