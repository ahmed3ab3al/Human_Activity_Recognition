import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/check_privacy.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_input_section.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../view_models/cubit.dart';
import '../../view_models/states.dart';

class SignUpViewBody extends StatelessWidget {
   SignUpViewBody({super.key});
 final GlobalKey<FormState> signUpFormKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: BlocConsumer<AppAuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthSignUpSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(child: Text(state.message)),
                ),
              );
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
                    const SignUpInputSection(),
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
                                AppAuthCubit.get(context)
                                    .signUpUser()
                                    .then((value) {
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.kLogin);
                                });
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
    );
  }
}
