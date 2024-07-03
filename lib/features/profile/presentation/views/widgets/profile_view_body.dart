import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/api/dio_helper.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/utils/service_locator.dart';
import 'package:graduation_project/core/widgets/custom_appBar.dart';
import 'package:graduation_project/core/widgets/custom_blue_button.dart';
import 'package:graduation_project/core/widgets/custom_loading_item.dart';

import 'package:graduation_project/features/profile/presentation/views/widgets/edit_textFormField.dart';
import '../../view_models/profile_cubit.dart';
import '../../view_models/profile_states.dart';

// ignore: must_be_immutable
class EditProfileBody extends StatelessWidget {
  EditProfileBody({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    nameController.text = CacheHelper().getData(key: userName);
    phoneController.text = CacheHelper().getData(key: userPhone);

    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<DioHelper>()),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is EditProfileSuccessState) {
            GoRouter.of(context).pop();
            const SnackBar(
              content: Center(child: Text('Edit Success')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 35.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomAppBar(
                        text: 'Edit Profile',
                        space: 60,
                        tab: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                      EditTextFormFiled(
                        hint: 'Name',
                        customController: nameController,
                        type: TextInputType.text,
                        prefix: Icons.person_outline_rounded,
                      ),
                      20.verticalSpace,
                      EditTextFormFiled(
                        hint: 'Number',
                        customController: phoneController,
                        type: TextInputType.number,
                        prefix: Icons.phone,
                      ),
                      50.verticalSpace,
                      state is EditProfileLoadingState
                          ? CustomLoadingItem(
                              width: MediaQuery.sizeOf(context).width / 1.1,
                              height: MediaQuery.sizeOf(context).height / 15,
                            )
                          : CustomBlueButton(
                              text: 'Update',
                              ontap: () {
                                if (formKey.currentState!.validate()) {
                                  ProfileCubit.get(context).editProfile(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    gender: 'male',
                                  );
                                } else {
                                  return;
                                }
                              },
                              containerHeight: 60)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
