import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/widgets/custom_appBar.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_another_way.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_buttons_view.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_input_section.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomAppBar(
                  text: 'Login',
                  space: 85,
                  tab: () {
                    GoRouter.of(context).pop();
                  },
                ),
                20.verticalSpace,
                const LoginInputSection(),
                3.verticalSpace,
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kVerify);
                  },
                  child: Text(
                      'Forgot password ?',
                      style: Styles.testStyle14.copyWith(color: ColorManager.blueColor0E4CA1)),
                ),
                20.verticalSpace,
                LoginButtonView(
                  formKey: formKey,
                ),
                20.verticalSpace,
                const Center(
                  child:  Text(
                    '-OR-',
                    style: TextStyle(
                        color:  ColorManager.greyColor757474,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                const LoginAnotherWay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
