import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/errors/exception.dart';
import 'package:graduation_project/features/auth/data/model/sign_up_model.dart';

import '../../../../../core/api/end_points.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.apiHelper) : super(SignUpInitial());

  final ApiHelper apiHelper;
  static SignUpCubit get(context) => BlocProvider.of(context);

  bool secure = true;
  List roleItems = ['patient', 'mentor'];
  var selectedValue = 'patient';


  void changeSecure() {
    secure = !secure;
    emit(ChangeSecureState());
  }

  void changeRole(String value) {
    selectedValue = value;
    emit(ChangeGenderState());
  }

  signUpUser({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String name,
    required String role
  }) async {
    try {
      emit(AuthSignUpLoadingState());
      final response = await apiHelper.post(
        EndPoints.signUp,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          'phone':phone,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
          ApiKeys.role: selectedValue,
        },
      );
      final signUpModel = SignUpModel.fromJson(response.data);
      emit(AuthSignUpSuccessState(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(AuthSignUpErrorState(error: e.errorModel.message));
    }
  }
}
