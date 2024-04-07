import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/api/dio_helper.dart';
import 'package:graduation_project/features/auth/presentation/view_models/forget_password_cubit/forget_password_cubit.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';



class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final confirmPasswordController = TextEditingController();
    final passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(DioHelper(dio: Dio())),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(child: Text(state.message)),
                )
            );
            GoRouter.of(context).pushReplacement(AppRouter.kLogin);
          }
          else if (state is ResetPasswordErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(child: Text(state.error)),
                )
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomAppBar(text: "Reset Password", space: 50, tab: () {
                        GoRouter.of(context).push(AppRouter.kLogin);
                      },),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Your new password must be different',
                                style: Styles
                                    .size16_400Grey757474,),
                              Text(
                                'from previously used password', style: Styles
                                  .size16_400Grey757474,),
                            ],
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      CustomTextFormFiled(
                        hint: 'Password',
                        secure: ForgetPasswordCubit.get(context).secure,
                        customController: passwordController,
                        type: TextInputType.visiblePassword,
                        prefix: Icons.lock_outline_rounded,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ForgetPasswordCubit.get(context).changeSecure();
                          },
                          icon: Icon(
                            ForgetPasswordCubit.get(context).secure ? Icons.visibility_off : Icons.visibility,
                            color: ColorManager.greyColor757474,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      30.verticalSpace,
                      CustomTextFormFiled(
                        hint: 'Confirmation Password',
                        secure: ForgetPasswordCubit.get(context).secure,
                        customController: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        prefix: Icons.lock_outline_rounded,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ForgetPasswordCubit.get(context).changeSecure();
                          },
                          icon: Icon(
                            ForgetPasswordCubit.get(context).secure ? Icons.visibility_off : Icons.visibility,
                            color: ColorManager.greyColor757474,
                            size: 25.sp,
                          ),
                        ),
                      ),
                      60.verticalSpace,
                      state is ResetPasswordLoadingState?
                          const CircularProgressIndicator():
                      CustomBlueButton(text: 'Confirm', ontap: () {
                        if (formKey.currentState!.validate()) {
                          ForgetPasswordCubit.get(context).resetPassword(
                              password: passwordController.text,
                              repassword: confirmPasswordController.text
                          );
                        } else {
                          return;
                        }
                      },
                        containerHeight: 60,)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

