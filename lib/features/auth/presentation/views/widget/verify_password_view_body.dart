import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import 'package:graduation_project/core/widgets/custom_blue_button.dart';
import 'custom_pin_put.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key});
  @override
  State<VerificationViewBody> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationViewBody> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 30.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
                CustomAppBar(
                text: "Verification",
                space: 60, tab: () {
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
              PinPutView(otpController: otpController),
              50.verticalSpace,
              CustomBlueButton(
                  text: 'Verify', ontap: () {
                GoRouter.of(context).push(AppRouter.kReset);
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
                    child: Text('Resend', style: Styles.testStyle14.copyWith(color: ColorManager.blueColor0E4CA1)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
