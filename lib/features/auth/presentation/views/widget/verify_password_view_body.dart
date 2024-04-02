import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/dio_helper.dart';
import 'package:graduation_project/features/auth/presentation/view_models/forget_password_cubit/forget_password_cubit.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import 'custom_pin_put.dart';

class VerificationViewBody extends StatelessWidget {
   const VerificationViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();
    final GlobalKey<FormState> verifyFormKey = GlobalKey();
    return BlocProvider(
  create: (context) => ForgetPasswordCubit(DioHelper(dio: Dio())),
  child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 30.h,
        ),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is VerifyCodeSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text('Code Verified')),
                ),
              );
              GoRouter.of(context).push(AppRouter.kReset);
            } else if (state is ResetPasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
            else if (state is CheckEmailSuccessState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text('Code is Send')),
                ),
              );
            }
            else if (state is CheckEmailErrorState){
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
                key: verifyFormKey,
                child: Column(
                  children: [
                    CustomAppBar(
                      text: "Verification",
                      space: 60,
                      tab: () {
                        GoRouter.of(context).push(AppRouter.kLogin);
                      },
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Please enter code that we have sent to',
                              style: Styles.size16_400Grey757474,
                            ),
                            Text(
                              ' your Email ',
                              style: Styles.size16_400Grey757474,
                            ),
                          ],
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    PinPutView(
                        otpController: otpController),
                    50.verticalSpace,
                    state is VerifyCodeLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomBlueButton(
                      text: 'Verify',
                      ontap: () {
                          if (verifyFormKey.currentState!.validate() && otpController.text.length == 6) {
                            ForgetPasswordCubit.get(context).verifyCode(
                              email: email,
                              otp: otpController.text
                            );
                            print(otpController.text);
                        }
                      },
                      containerHeight: 60,
                    ),
                    35.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don’t receive the code ?'),
                        // style: Styles.hintTextSize,),
                        TextButton(
                          onPressed: () {
                            ForgetPasswordCubit.get(context).forgetPassword(email: email);
                          },
                          child: Text('Resend',
                              style: Styles.testStyle14.copyWith(
                                  color: ColorManager.blueColor0E4CA1)),
                        ),
                      ],
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
