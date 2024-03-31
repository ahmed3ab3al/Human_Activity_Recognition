import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/widgets/custom_appBar.dart';
import 'package:graduation_project/features/auth/presentation/view_models/cubit.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_another_way.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_buttons_view.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_input_section.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_button_view.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../view_models/states.dart';

class LoginViewBody extends StatelessWidget {
   LoginViewBody({super.key});
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: BlocConsumer<AppAuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthLoginSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text('Login Success')),
                ),
              );
            } else if (state is AuthLoginErrorState) {
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
                key: loginFormKey,
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
                        GoRouter.of(context).push(AppRouter.kCheckEmail);
                      },
                      child: Text('Forgot password ?',
                          style: Styles.testStyle14
                              .copyWith(color: ColorManager.blueColor0E4CA1)),
                    ),
                    20.verticalSpace,
                    state is AuthLoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        :  LoginButtonView(
                      formKey: loginFormKey,
                    ),
                    25.verticalSpace,
                    const SignUpButtonView(),
                    20.verticalSpace,
                    const Center(
                      child: Text(
                        '-OR-',
                        style: TextStyle(
                            color: ColorManager.greyColor757474,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const LoginAnotherWay(),
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
