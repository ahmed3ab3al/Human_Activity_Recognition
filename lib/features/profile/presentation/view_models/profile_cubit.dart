import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';

import 'package:graduation_project/features/profile/presentation/view_models/profile_states.dart';
import '../../../../../core/api/api_helper.dart';
import '../../../../constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../auth/data/model/login_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.apiHelper) : super(ProfileInitial());
  final ApiHelper apiHelper;

  static ProfileCubit get(context) => BlocProvider.of(context);

  // getUser() async {
  //   try {
  //     emit(GetUserProfileLoadingState());
  //     final response = apiHelper.get(
  //       EndPoints.getUserId(CacheHelper().getData(key: token)),
  //     );
  //     emit(GetUserProfileSuccessState(
  //         userModel: UserModel.fromJson(response as Map<String, dynamic>)));
  //   } on ServerException catch (e) {
  //     emit(GetUserProfileErrorState(error: e.errorModel.message));
  //   }
  // }

  editProfile(
      {required String name,
      required String phone,
      required String gender}) async {
    try {
      emit(EditProfileLoadingState());
      final response = await apiHelper.put(
        EndPoints.editProfile,
        data: {
          ApiKeys.name: name,
          ApiKeys.phone: phone,
          ApiKeys.gender: gender
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
      emit(EditProfileSuccessState());
    } on ServerException catch (e) {
      emit(EditProfileErrorState(error: e.errorModel.message));
    }
  }
}
