import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_view_body.dart';
import '../../../../../constants.dart';
import '../../../../../core/api/dio_helper.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../view_models/mentor_medicine_cubit/mentor_medicine_cubit.dart';
import '../../view_models/mentor_medicine_cubit/mentor_medicine_state.dart';
import 'medicine_view_loading.dart';

class MentorMedicineViewBody extends StatelessWidget {
  const MentorMedicineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      MentorMedicineCubit(getIt.get<DioHelper>())
        ..getPatientsMedicine(patientID: patientID),
      child: BlocBuilder<MentorMedicineCubit, MentorMedicineStates>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 30.h),
                child: Column(
                  children: [
                    CustomAppBar(
                      tab: () {
                        GoRouter.of(context).push(AppRouter.kBackHome);
                      },
                      text: 'Treatment registration',
                      space: 20,
                    ),
                    if (state is GetPatientMedicineLoading)
                      const MedicineViewLoading(),
                    if (state is GetPatientMedicineError)
                      Center(
                        child: Text(
                          state.error.toString(),
                        ),
                      ),
                    if (state is! GetPatientMedicineLoading && state is! GetPatientMedicineError)
                       MedicineViewBody(
                        getPatientMedicine: MentorMedicineCubit.get(context).getPatientMedicine!,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
