import 'package:flutter/material.dart';
import 'package:graduation_project/features/auth/presentation/view_models/cubit.dart';
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
          if (formKey.currentState!.validate()) {
            AppAuthCubit.get(context).signInUser();
          }
        });
  }
}
