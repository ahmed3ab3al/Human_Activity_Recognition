import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/medicine_cubit/medicine_cubit.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/medicine_cubit/medicine_state.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_view_body.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_view_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../home/presentation/views/widgets/image_text_welcome.dart';
import '../../../home/presentation/views/widgets/name_profile_row.dart';

class PatientMedicineView extends StatelessWidget {
  const PatientMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController =
    RefreshController(initialRefresh: false);
    return BlocBuilder<MedicineCubit, MedicineStates>(
      builder: (context, state) {
        return SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          onRefresh: () {
            MedicineCubit.get(context).refreshPatientsMedicine(refreshController);
          },
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                child: Column(
                  children: [
                    const ImageText(),
                    const NameProfileRow(),
                     if (state is GetPatientMedicineLoading || state is GetPatientMedicineError)
                       const MedicineViewLoading(),
                     if (MedicineCubit.get(context).getPatientMedicineTrue && state is! GetPatientMedicineLoading)
                       MedicineViewBody(
                      getPatientMedicine: MedicineCubit.get(context).getPatientMedicine,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
