import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_button.dart';

class LoginAnotherWay extends StatelessWidget {
  const LoginAnotherWay({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        20.verticalSpace,
        CustomButton(
          image: const AssetImage(AppAssets.google),
          text: 'Sign in with Google',
          onTap: () {},
        ),
        25.verticalSpace,
        CustomButton(
          image: const AssetImage(AppAssets.facebook),
          text: 'Sign in with Facebook',
          onTap: () {},
        )
      ],
    );
  }
}
