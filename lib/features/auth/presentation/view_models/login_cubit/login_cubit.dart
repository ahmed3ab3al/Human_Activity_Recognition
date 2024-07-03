import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/exception.dart';
import 'package:graduation_project/features/auth/data/model/login_model.dart';
import '../../../../../core/api/api_helper.dart';
import '../../../../../core/utils/assets.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiHelper) : super(LoginInitial());
  final ApiHelper apiHelper;
  static LoginCubit get(context) => BlocProvider.of(context);

  bool secure = true;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  void changeSecure() {
    secure = !secure;
    emit(ChangeSecureState());
  }

  signInUser() async {
    try {
      emit(LoginLoadingState());
      final response = await apiHelper.post(
        EndPoints.login,
        data: {
          ApiKeys.email: loginEmailController.text,
          ApiKeys.password: loginPasswordController.text,
        },
      );
      CacheHelper().saveData(
          key: token, value: LoginModel.fromJson(response.data).token);
      CacheHelper().saveData(
          key: role, value: LoginModel.fromJson(response.data).user!.role);
      CacheHelper().saveData(
          key: userId, value: LoginModel.fromJson(response.data).user!.id);
      CacheHelper().saveData(
          key: userEmail,
          value: LoginModel.fromJson(response.data).user!.email);
      CacheHelper().saveData(
          key: userRole, value: LoginModel.fromJson(response.data).user!.role);
      CacheHelper().saveData(
          key: userVerified,
          value: LoginModel.fromJson(response.data).user!.verified);
      CacheHelper().saveData(
          key: userName, value: LoginModel.fromJson(response.data).user!.name);
      CacheHelper().saveData(
          key: userPhone,
          value: LoginModel.fromJson(response.data).user!.phone);

      personImage = CacheHelper().getData(key: userRole) == 'mentor' ? AppAssets.person : AppAssets.oldPerson;
      anotherImage = CacheHelper().getData(key: userRole) == 'mentor' ? AppAssets.oldPerson : AppAssets.person;
      emit(LoginSuccessState(
          message: LoginModel.fromJson(response.data).message!));
    } on ServerException catch (e) {
      emit(LoginErrorState(error: e.errorModel.message));
    }
  }
}
