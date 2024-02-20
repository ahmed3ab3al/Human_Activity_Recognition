import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/check_privacy.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_input_section.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blueButton.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomAppBar(
                    text: "Sign Up",
                    space: 75,
                    tab: () {
                      GoRouter.of(context).push(AppRouter.kLogin);
                    }
                ),
                25.verticalSpace,
                const SignUpInputSection(),
                25.verticalSpace,
                const CheckPrivacy(),
                35.verticalSpace,
                CustomBlueButton(
                  text: 'Sign UP',
                  ontap: (){
                    if(formKey.currentState!.validate()) {
                      if(role=='Mentor'){
                        GoRouter.of(context).pushReplacement(AppRouter.kBackHome);
                      }else{
                        GoRouter.of(context).pushReplacement(AppRouter.kPatientHome);
                      }                    }
                  },
                  containerHeight: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

