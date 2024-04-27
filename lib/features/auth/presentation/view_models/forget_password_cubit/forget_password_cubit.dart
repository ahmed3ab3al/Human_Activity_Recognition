import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/auth/data/model/verify_code_model.dart';

import '../../../../../core/api/api_helper.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/exception.dart';
import '../../../data/model/forget_password_model.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.apiHelper) : super(ForgetPasswordInitial());
  final ApiHelper apiHelper;
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);


  bool secure = true;
  void changeSecure() {
    secure = !secure;
    emit(ChangeSecureState());
  }
  forgetPassword({
    required email
  }) async {
    try {
      emit(CheckEmailLoadingState());
      final response = await apiHelper.post(
        EndPoints.forgetPassword,
        data: {
          ApiKeys.email: email,
        },
      );
      final forgetPasswordModel = ForgetPasswordModel.fromJson(response.data);
      emit(CheckEmailSuccessState(message: forgetPasswordModel.message));
    }
    on ServerException catch (e) {
      emit(CheckEmailErrorState(error: e.errorModel.message));
    }
  }

  verifyCode({
    required String otp,
    required String email
}) async {
    try {
      emit(VerifyCodeLoadingState());
      final response = await apiHelper.post(
        EndPoints.otp,
        data: {
          'email':email,
          ApiKeys.code: otp,
        },
      );
      final verifyCodeModel = VerifyCode.fromJson(response.data);
      CacheHelper().saveData(key: token, value: verifyCodeModel.token);
      emit(VerifyCodeSuccessState(message: verifyCodeModel.message!));
    }
    on ServerException catch (e) {
      emit(ResetPasswordErrorState(error: e.errorModel.message));
    }
  }


  resetPassword({
    required String password,
    required String repassword
  }) async {
    try {
      emit(ResetPasswordLoadingState());
      await apiHelper.patch(
        EndPoints.confirm_reset_password,
        data: {
          'password':password,
          'repassword': repassword,
        },
      );
      emit(ResetPasswordSuccessState(message: "Success"));
    }
    on ServerException catch (e) {
      emit(ResetPasswordErrorState(error: e.errorModel.message));
    }
  }
  
  
}
