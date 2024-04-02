import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/presentation/view_models/login_cubit/login_cubit.dart';

import '../../../../../core/widgets/custom_blue_button.dart';

class LoginButtonView extends StatelessWidget {
 final GlobalKey<FormState> formKey ;
 final String email;
 final String password;
 const LoginButtonView({super.key, required this.formKey, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return CustomBlueButton(
        containerHeight: 60,
        text: 'Login',
        ontap: () {
          if (formKey.currentState!.validate()) {
            LoginCubit.get(context).signInUser(email: email,password: password);
          }
        });
  }
}
