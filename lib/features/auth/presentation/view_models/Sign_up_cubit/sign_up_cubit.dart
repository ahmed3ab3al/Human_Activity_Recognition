import 'package:flutter/cupertino.dart';
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

  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();
  final TextEditingController signUpPhoneController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();

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

  signUpUser() async {
    try {
      emit(AuthSignUpLoadingState());
      final response = await apiHelper.post(
        EndPoints.signUp,
        data: {
          ApiKeys.name: signUpNameController.text,
          ApiKeys.email: signUpEmailController.text,
          'phone': signUpPhoneController.text,
          ApiKeys.password: signUpPasswordController.text,
          ApiKeys.confirmPassword: signUpConfirmPasswordController.text,
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
