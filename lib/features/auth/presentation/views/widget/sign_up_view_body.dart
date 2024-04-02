import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/presentation/view_models/Sign_up_cubit/sign_up_cubit.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/check_privacy.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_input_section.dart';
import '../../../../../core/api/dio_helper.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  final TextEditingController signUpPasswordController = TextEditingController();
  final TextEditingController signUpConfirmPasswordController = TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUpPhoneController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit( DioHelper(dio: Dio()),),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is AuthSignUpSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text(state.message)),
                  ),
                );
                if (state.message == "success") {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kLogin);
                }
              } else if (state is AuthSignUpErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text(state.error)),
                  ),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
                      CustomAppBar(
                          text: "Sign Up",
                          space: 75,
                          tab: () {
                            GoRouter.of(context).push(AppRouter.kLogin);
                          }),
                      25.verticalSpace,
                      SignUpInputSection(
                        signUpConfirmPasswordController: signUpConfirmPasswordController,
                        signUpEmailController: signUpEmailController,
                        signUpNameController: signUpNameController,
                        signUpPasswordController: signUpPasswordController,
                        signUpPhoneController: signUpPhoneController,
                      ),
                      25.verticalSpace,
                      const CheckPrivacy(),
                      35.verticalSpace,
                      state is AuthSignUpLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : CustomBlueButton(
                        text: 'Sign UP',
                        ontap: () {
                          if (signUpFormKey
                              .currentState!
                              .validate()) {
                            SignUpCubit.get(context)
                                .signUpUser(
                              email: signUpEmailController.text,
                              password: signUpPasswordController.text,
                              name: signUpNameController.text,
                              confirmPassword: signUpConfirmPasswordController
                                  .text,
                              phone: signUpPhoneController.text,
                            );
                          }
                        },
                        containerHeight: 60,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
