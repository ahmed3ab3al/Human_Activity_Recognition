import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/widgets/custom_appBar.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/custom_password_text_field.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/or_text_view.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_button.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_blueButton.dart';
import '../../../../../core/widgets/custom_textFormField.dart';
import 'custom_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});
  @override
  State<LoginViewBody> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 30.h
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomAppBar(text: 'Login', space: 85, tab: () {
                    GoRouter.of(context).push(AppRouter.kSelection);
                  },),
                  20.verticalSpace,
                  CustomTextFormFiled(
                      hint: 'Email',
                      customController: emailController,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email_outlined),
                  24.verticalSpace,
                  CustomPasswordTextFormFiled(
                    hint: 'Password',
                    customController: passwordController,
                  ),
                  3.verticalSpace,
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kVerify);
                        },
                        child: Text('Forgot password ?',
                            style: Styles.size14_400Blue0E4CA1),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  CustomBlueButton(containerHeight: 60,text: 'Login', ontap: () {
                    if(formKey.currentState!.validate())
                    {
                      GoRouter.of(context).push(AppRouter.kBackHome);

                    }else
                    {
                      return;
                    }
                  }
                  ),
                  25.verticalSpace,
                  SignUpButton(text: 'Sign up', onTap: () {

                    GoRouter.of(context).push(AppRouter.kSignUp);

                  }),
                  20.verticalSpace,
                  const ORTextView(),
                  20.verticalSpace,
                  CustomButton(
                    image: const AssetImage('images/google_image.png'),
                    text: 'Sign in with Google',
                    onTap: () {},
                  ),
                  25.verticalSpace,
                  CustomButton(
                    image: const AssetImage('images/facebook_Image.png'),
                    text: 'Sign in with Facebook',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}