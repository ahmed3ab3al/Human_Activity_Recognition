import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widgets/custom_textFormField.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/custom_password_text_field.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blueButton.dart';
import '../../../../../core/widgets/custom_check_box.dart';
import 'custom_rich_text.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});
  @override
  State<SignUpViewBody> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpViewBody> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool secure = true;
  bool isChecked = false;
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
                   CustomAppBar(text: "Sign Up",space: 75, tab: () {
                     GoRouter.of(context).push(AppRouter.kLogin);
                   },),
                  25.verticalSpace,
                  CustomTextFormFiled(
                    hint: 'Name ',
                    customController: nameController,
                    type: TextInputType.name,
                    prefix:Icons.person_outline_rounded,
                  ),
                  25.verticalSpace,
                  CustomTextFormFiled(
                      hint: 'Number',
                      customController: phoneController,
                      type: TextInputType.phone,
                      prefix:Icons.phone),
                  25.verticalSpace,
                  CustomTextFormFiled(
                    hint: 'Email ',
                    customController: emailController,
                    type: TextInputType.emailAddress,
                    prefix:Icons.email_outlined,
                  ),
                  25.verticalSpace,
                  CustomPasswordTextFormFiled(
                    hint: 'Password',
                    customController: passwordController,
                  ),
                  25.verticalSpace,
                  CustomPasswordTextFormFiled(
                    hint: 'Confirmation Password',
                    customController: confirmPasswordController,
                  ),
                  25.verticalSpace,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     CustomCheckBox(),
                      CustomRichText(),
                    ],
                  ),
                  35.verticalSpace,
                  CustomBlueButton(text: 'Sign UP',ontap: (){
                    if(formKey.currentState!.validate())
                    {
                      GoRouter.of(context).push(AppRouter.kBackHome);

                    }else
                    {
                      return;
                    }
                  },containerHeight: 60,)
                ],
              ),
            ),
          ),
        ),
    );
  }
}