import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_models/Sign_up_cubit/sign_up_cubit.dart';

class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SignUpCubit.get(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormFiled(
              hint: 'Name ',
              customController: cubit.signUpNameController,
              type: TextInputType.name,
              prefix: Icons.person_outline_rounded,
            ),
            25.verticalSpace,
            CustomTextFormFiled(
                hint: 'Number',
                customController: cubit.signUpPhoneController,
                type: TextInputType.phone,
                prefix: Icons.phone),
            25.verticalSpace,
            CustomTextFormFiled(
              hint: 'Email ',
              customController: cubit.signUpEmailController,
              type: TextInputType.emailAddress,
              prefix: Icons.email_outlined,
            ),
            25.verticalSpace,
            CustomTextFormFiled(
              hint: 'Password',
              secure: SignUpCubit.get(context).secure,
              customController: cubit.signUpPasswordController,
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
              customController: cubit.signUpConfirmPasswordController,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Role :  ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  DropdownButton(
                      icon: const Icon(Icons.arrow_drop_down_circle_rounded,
                          size: 25, color: Color(0xcb094fde)),
                      value: SignUpCubit.get(context).selectedValue,
                      items: SignUpCubit.get(context).roleItems.map((element) {
                        return DropdownMenuItem(
                          value: element,
                          child: Text(
                            element.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        );
                      }).toList(),
                      onChanged: (dynamic value) {
                        SignUpCubit.get(context).changeRole(value);
                      }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
