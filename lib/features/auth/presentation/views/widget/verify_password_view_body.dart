import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/data/model/verify_code_model.dart';
import 'package:graduation_project/features/auth/presentation/view_models/cubit.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../view_models/states.dart';
import 'custom_pin_put.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key});
  @override
  State<VerificationViewBody> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationViewBody> {
  final otpController = TextEditingController();
  final GlobalKey<FormState> verifyFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 30.h,
        ),
        child: BlocConsumer<AppAuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthVerifyCodeSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text('Code Verified')),
                ),
              );
            } else if (state is AuthVerifyCodeErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
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
                        otpController: AppAuthCubit.get(context).otpController),
                    50.verticalSpace,
                    state is AuthVerifyCodeLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomBlueButton(
                            text: 'Verify',
                            ontap: () {
                              if (verifyFormKey.currentState!.validate()) {
                                if (AppAuthCubit.get(context)
                                        .otpController.text.length == 6) {
                                  AppAuthCubit.get(context).verifyCode();
                                  GoRouter.of(context).push(AppRouter.kReset);
                                }
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
                          onPressed: () {},
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
    );
  }
}
