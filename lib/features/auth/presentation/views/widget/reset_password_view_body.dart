import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blueButton.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_textFormField.dart';
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
                  CustomTextFormFiled(
                    hint: 'Password',
                    secure: secure,
                    customController: passwordController,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock_outline_rounded,
                    suffixIcon: IconButton(
                      onPressed: () {
                        secure = !secure;
                        setState(() {});
                      },
                      icon: Icon(
                        secure ? Icons.visibility_off : Icons.visibility,
                        color: ColorManager.greyColor757474,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  CustomTextFormFiled(
                    hint: 'Confirmation Password',
                    secure: secure,
                    customController: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock_outline_rounded,
                    suffixIcon: IconButton(
                      onPressed: () {
                        secure = !secure;
                        setState(() {});
                      },
                      icon: Icon(
                        secure ? Icons.visibility_off : Icons.visibility,
                        color: ColorManager.greyColor757474,
                        size: 25.sp,
                      ),
                    ),
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
