import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/errors/exception.dart';
import 'package:graduation_project/features/auth/data/model/login_model.dart';
import '../../../../../core/api/api_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiHelper) : super(LoginInitial());
  final ApiHelper apiHelper;
  static LoginCubit get(context) => BlocProvider.of(context);

  bool secure = true;

  void changeSecure() {
    secure = !secure;
    emit(ChangeSecureState());
  }
  signInUser({required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      final response = await apiHelper.post(
        EndPoints.login,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      CacheHelper().saveData(
          key: token, value: LoginModel.fromJson(response.data).token);
      CacheHelper().saveData(key: role, value: LoginModel.fromJson(response.data).user!.role);
      emit(LoginSuccessState(message: LoginModel.fromJson(response.data).message!));
    } on ServerException catch (e) {
      emit(LoginErrorState(error: e.errorModel.message));
    }
  }
}
