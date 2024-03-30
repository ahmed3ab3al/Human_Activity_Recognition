import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/manager/cubit.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_blue_button.dart';

class LoginButtonView extends StatelessWidget {
 final GlobalKey<FormState> formKey ;
   const LoginButtonView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CustomBlueButton(
        containerHeight: 60,
        text: 'Login',
        ontap: () {
          context.read<AppAuthCubit>().signInUser();
          if (formKey.currentState!.validate()) {
            if ( AppAuthCubit.get(context).roleName == 'mentor') {
              GoRouter.of(context).pushReplacement(AppRouter.kBackHome);
            } else {
              GoRouter.of(context).pushReplacement(AppRouter.kPatientHome);
            }
          }
        });
  }
}
