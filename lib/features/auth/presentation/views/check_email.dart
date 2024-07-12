import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/dio_helper.dart';
import 'package:graduation_project/features/auth/presentation/view_models/forget_password_cubit/forget_password_cubit.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_blue_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CheckEmail extends StatelessWidget {
  CheckEmail({super.key});

  final GlobalKey<FormState> checkEmailKey = GlobalKey();
  final TextEditingController checkEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt.get<DioHelper>()),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is CheckEmailSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.message)),
              ),
            );
            email = checkEmailController.text;
            GoRouter.of(context).push(AppRouter.kVerify);
          }
          if (state is CheckEmailErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.error)),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: checkEmailKey,
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormFiled(
                      hint: 'Email',
                      customController: checkEmailController,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email_outlined,
                    ),
                    50.verticalSpace,
                    state is CheckEmailLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomBlueButton(
                            containerHeight: 60,
                            text: 'Send Code',
                            ontap: () {
                              if (checkEmailKey.currentState!.validate()) {
                                ForgetPasswordCubit.get(context).forgetPassword(
                                  email: checkEmailController.text,
                                );
                              }
                            }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
