import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:  SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark
          ),
          child: LoginViewBody()
      ),
    );
  }
}
