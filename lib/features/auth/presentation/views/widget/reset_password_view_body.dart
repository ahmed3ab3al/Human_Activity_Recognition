import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/custom_password_text_field.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blueButton.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});
  @override
  State<ResetPasswordViewBody> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<ResetPasswordViewBody> {
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                   CustomAppBar(text: "Reset Password",space: 50, tab: () {
                     GoRouter.of(context).push(AppRouter.kLogin);

                   },),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Your new password must be different',style: Styles.size16_400Grey757474,),
                          Text('from previously used password',style: Styles.size16_400Grey757474,),
                        ],
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  CustomPasswordTextFormFiled(
                    hint: 'Password',
                    customController: passwordController,
                  ),
                  30.verticalSpace,
                  CustomPasswordTextFormFiled(
                    hint: 'Confirmation Password',
                    customController: confirmPasswordController,
                  ),
                  60.verticalSpace,
                  CustomBlueButton(text: 'Confirm',ontap: (){
                    if(formKey.currentState!.validate())
                    {
                      GoRouter.of(context).push(AppRouter.kLogin);

                    }else
                    {
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
  }
}
