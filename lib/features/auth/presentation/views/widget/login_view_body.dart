import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_buttons_view.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_input_section.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_button_view.dart';
import 'package:lottie/lottie.dart';
import '../../../../../constants.dart';
import '../../../../../core/api/dio_helper.dart';
import '../../../../../core/socket/socket.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_loading_item.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<DioHelper>()),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text(state.message)),
                  ),
                );
                if (state.message == 'success') {
                  if (CacheHelper().getData(key: role) == 'mentor') {
                    // MentorCubit.get(context).getPatients();
                    GoRouter.of(context).pushReplacement(AppRouter.kBackHome);
                  } else if (CacheHelper().getData(key: role) == 'patient') {
                    // PatientCubit.get(context).getMentorRequests();
                    // MedicineCubit.get(context).getPatientsMedicine(patientID: CacheHelper().getData(key: userId));
                    Future.delayed(const Duration(seconds: 2));
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kPatientHome);
                  }
                  AppSocket.appSocket();
                }
              } else if (state is LoginErrorState) {
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
                  key: LoginCubit.get(context).loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Lottie.asset(AppAssets.animation),
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
                      state is LoginLoadingState &&
                              LoginCubit.get(context)
                                  .loginFormKey
                                  .currentState!
                                  .validate()
                          ? CustomLoadingItem(
                              width: MediaQuery.sizeOf(context).width / 1.1,
                              height: MediaQuery.sizeOf(context).height / 15,
                            )
                          : LoginButtonView(
                              formKey: LoginCubit.get(context).loginFormKey,
                            ),
                      25.verticalSpace,
                      const SignUpButtonView(),
                      20.verticalSpace,
                      // const Center(
                      //   child: Text(
                      //     '-OR-',
                      //     style: TextStyle(
                      //         color: ColorManager.greyColor757474,
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                      // const LoginAnotherWay(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
