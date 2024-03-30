import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_blue_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/cubit.dart';
import '../../manager/states.dart';

class CheckEmail extends StatelessWidget {
   CheckEmail({super.key});
final GlobalKey<FormState> checkEmailKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AuthStates>(
  listener: (context, state) {
    if (state is AuthCheckEmailSuccessState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text(state.message)),
        ),
      );
    }
    if (state is AuthCheckEmailErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text(state.error)),
        ),
      );
    }
    },
  builder: (context, state) {
    return Scaffold(
      body: Form(
        key: checkEmailKey,
        child: Padding(
          padding:  EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFiled(
                hint: 'Email',
                customController: AppAuthCubit.get(context).checkEmailController,
                type: TextInputType.emailAddress,
                prefix: Icons.email_outlined,
              ),
              50.verticalSpace,
              state is AuthCheckEmailLoadingState ?
              const Center(child: CircularProgressIndicator()) :
              CustomBlueButton(
                  containerHeight: 60,
                  text: 'Send Code',
                  ontap: () {
                    if (checkEmailKey.currentState!.validate()) {
                      AppAuthCubit.get(context).forgetPassword();
                      GoRouter.of(context).push(AppRouter.kVerify);
                    }
                  }),
            ],

          ),
        ),
      ),
    );
  },
);
  }
}