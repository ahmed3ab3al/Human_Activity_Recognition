import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/sign_up_button.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_blueButton.dart';

class LoginButtonView extends StatelessWidget {
  const LoginButtonView({super.key, this.formKey});

  final formKey;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomBlueButton(
            containerHeight: 60,
            text: 'Login',
            ontap: () {
              if(formKey.currentState!.validate()) {
                GoRouter.of(context).pushReplacement(AppRouter.kBackHome);
              }
            }
        ),
        25.verticalSpace,
        SignUpButton(
            text: 'Sign up',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSignUp);
            }
        ),
      ],
    );
  }
}
