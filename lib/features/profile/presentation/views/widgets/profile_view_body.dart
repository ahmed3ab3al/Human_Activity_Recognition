import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widgets/custom_appBar.dart';
import 'package:graduation_project/core/widgets/custom_blue_button.dart';

import 'package:graduation_project/features/profile/presentation/views/widgets/edit_password_text_field.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/edit_textFormField.dart';
import '../../../../../core/utils/app_router.dart';
import '../../view_models/profile_cubit.dart';
import '../../view_models/profile_states.dart';

// ignore: must_be_immutable
class EditProfileBody extends StatelessWidget {
  EditProfileBody({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // final GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileStates >(
          listener: (context, state) {


            if (state is GetUserProfileSuccessState) {
              nameController.text = state.userModel.name;
              phoneController.text = state.userModel.id;
              emailController.text = state.userModel.email;
            }

          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 35.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomAppBar(
                      text: 'Edit Profile',
                      space: 60,
                      tab: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    30.verticalSpace,
                    EditTextFormFiled(
                      hint: 'Name',
                      customController: nameController,
                      type: TextInputType.text,
                      prefix: Icons.person_outline_rounded,
                    ),
                    20.verticalSpace,
                    EditTextFormFiled(
                      hint: 'Number',
                      customController: phoneController,
                      type: TextInputType.number,
                      prefix: Icons.phone,
                    ),
                    20.verticalSpace,
                    EditTextFormFiled(
                      hint: 'Email',
                      customController: emailController,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email_outlined,
                    ),
                    20.verticalSpace,
                    EditPasswordTextFormFiled(
                      hint: 'Password',
                      customController: passwordController,
                    ),
                    100.verticalSpace,
                    CustomBlueButton(
                        text: 'Update',
                        ontap: () {
                          if (formKey.currentState!.validate()) {
                            ProfileCubit.get(context).editProfile(
                              name: nameController.text,
                              phone: phoneController.text,
                              gender: 'male',
                            );
                            GoRouter.of(context).push(AppRouter.kBackHome);
                          } else {
                            return;
                          }
                        },
                        containerHeight: 60)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
