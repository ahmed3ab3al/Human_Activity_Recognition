// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/exception.dart';
import 'package:graduation_project/features/auth/presentation/view_models/states.dart';
import '../../data/model/forget_password_model.dart';
import '../../data/model/verify_code_model.dart';

class AppAuthCubit extends Cubit<AuthStates> {
  AppAuthCubit(this.apiHelper) : super(AuthInitialState());
  final ApiHelper apiHelper;
  static AppAuthCubit get(context) => BlocProvider.of(context);
  bool secure = true;

  TextEditingController checkEmailController = TextEditingController();
  TextEditingController otpController = TextEditingController();


  forgetPassword() async {
    try {
      emit(AuthCheckEmailLoadingState());
      final response = await apiHelper.post(
        EndPoints.forgetPassword,
        data: {
          ApiKeys.email: checkEmailController.text,
        },
      );
      final forgetPasswordModel = ForgetPasswordModel.fromJson(response.data);
      emit(AuthCheckEmailSuccessState(message: forgetPasswordModel.message));
    }
    on ServerException catch (e) {
      emit(AuthCheckEmailErrorState(error: e.errorModel.message));
    }
  }

  verifyCode() async {
    try {
      emit(AuthVerifyCodeLoadingState());
      final response = await apiHelper.post(
        EndPoints.otp,
        data: {
          ApiKeys.otp: otpController.text,
        },
      );
      final verifyCodeModel = VerifyCode.fromJson(response.data);
      CacheHelper().saveData(key: token, value: verifyCodeModel.result);
      emit(AuthVerifyCodeSuccessState(message: verifyCodeModel.message));
    }
    on ServerException catch (e) {
      emit(AuthVerifyCodeErrorState(error: e.errorModel.message));
    }
  }

}
