// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/exception.dart';
import 'package:graduation_project/features/auth/data/model/login_model.dart';
import 'package:graduation_project/features/auth/data/model/sign_up_model.dart';
import 'package:graduation_project/features/auth/presentation/view_models/states.dart';
import '../../data/model/forget_password_model.dart';

class AppAuthCubit extends Cubit<AuthStates> {
  AppAuthCubit(this.apiHelper) : super(AuthInitialState());
  final ApiHelper apiHelper;
  static AppAuthCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> loginFormKey = GlobalKey();
  bool secure = true;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController checkEmailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  List genderItems = ['male', 'female'];
  var selectedValue = 'male';
  String roleName = '';

  void changeGender(String value) {
    emit(LoadingGenderState());
    selectedValue = value;
    emit(ChangeGenderState());
  }

  Future <void>signInUser() async {
    try {
      emit(AuthLoginLoadingState());
      final response = await apiHelper.post(
        EndPoints.login,
        data: {
          ApiKeys.email: loginEmailController.text,
          ApiKeys.password: loginPasswordController.text,
        },
      );
      CacheHelper().saveData(
          key: ApiKeys.token, value: LoginModel.fromJson(response.data).token);
      emit(AuthLoginSuccessState());
    } on ServerException catch (e) {
      emit(AuthLoginErrorState(error: e.errorModel.message));
      print(e);
    }
  }

  signUpUser() async {
    try {
      emit(AuthSignUpLoadingState());
      final response = await apiHelper.post(
        EndPoints.signUp,
        data: {
          ApiKeys.name: signUpNameController.text,
          ApiKeys.email: signUpEmailController.text,
          ApiKeys.gender: selectedValue,
          ApiKeys.password: signUpPasswordController.text,
          ApiKeys.confirmPassword: signUpConfirmPasswordController.text,
          ApiKeys.role: roleName,
        },
      );
      final signUpModel = SignUpModel.fromJson(response.data);
      emit(AuthSignUpSuccessState(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(AuthSignUpErrorState(error: e.errorModel.message));
    }
  }

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


}
