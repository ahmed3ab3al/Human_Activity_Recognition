import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/features/profile/presentation/view_models/profile_states.dart';
import '../../../../../core/api/api_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.apiHelper) : super(ProfileInitial());
  final ApiHelper apiHelper;

  static ProfileCubit get(context) => BlocProvider.of(context);

}