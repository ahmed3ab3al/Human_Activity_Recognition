import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_button.dart';
import '../../../../../core/utils/app_router.dart';

class SignUpButtonView extends StatelessWidget {
  const SignUpButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignUpButton(
        text: 'Sign up',
        onTap: () {
          GoRouter.of(context).push(AppRouter.kSignUp);
        });
  }
}
