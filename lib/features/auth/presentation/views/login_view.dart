import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/presentation/views/widget/login_view_body.dart';
import '../../../../core/api/dio_helper.dart';
import '../view_models/cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppAuthCubit( DioHelper(dio: Dio()),),
    child: Scaffold(
      body: LoginViewBody(),
    ),);
  }
}
