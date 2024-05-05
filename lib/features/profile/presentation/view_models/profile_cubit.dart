import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/profile/data/user_model.dart';

import 'package:graduation_project/features/profile/presentation/view_models/profile_states.dart';
import '../../../../../core/api/api_helper.dart';
import '../../../../constants.dart';
import '../../../../core/errors/exception.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.apiHelper) : super(ProfileInitial());
  final ApiHelper apiHelper;

  static ProfileCubit get(context) => BlocProvider.of(context);

  getUser() async {
    try {
      emit(GetUserProfileLoadingState());
      final response = apiHelper.get(
        EndPoints.getUserId(CacheHelper().getData(key: token)),
      );
      emit(GetUserProfileSuccessState(
          userModel: UserModel.fromJson(response as Map<String, dynamic>)));
    } on ServerException catch (e) {
      emit(GetUserProfileErrorState(error: e.errorModel.message));
    }
  }
}
