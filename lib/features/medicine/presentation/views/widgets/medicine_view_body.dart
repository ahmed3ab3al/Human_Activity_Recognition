import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/mentor_medicine_cubit/mentor_medicine_cubit.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/mentor_medicine_cubit/mentor_medicine_state.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_view_loading.dart';

import '../../../../../constants.dart';
import '../../../../../core/api/dio_helper.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_icon.dart';
import 'custom_container_medicine.dart';

class MedicineViewBody extends StatelessWidget {
  const MedicineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MentorMedicineCubit(getIt.get<DioHelper>())..getPatientsMedicine(patientID: patientID),
      child: BlocBuilder<MentorMedicineCubit, MentorMedicineStates>(
        builder: (context, state) {
          if (state is GetPatientMedicineLoading) {
            return const MedicineViewLoading();
          }
          else if (state is GetPatientMedicineError) {
            return Center(
              child: Text(
                state.error.toString(),
              ),
            );
          }
          else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: DatePicker(
                      DateTime.now(),
                      height: 100.h,
                      width: 50.w,
                      initialSelectedDate: DateTime.now(),
                      selectedTextColor: Colors.white,
                      selectionColor: Colors.blue,
                      dateTextStyle: Styles.size16_700Black,
                      onDateChange: (date) {
                        //  selected=date;
                      },
                    ),
                  ),
                  20.verticalSpace,
                  // Should Be In List
                  // Text(
                  //   'Before Meals',
                  //   style: Styles.size16_700Black,
                  // ),
                  // 30.verticalSpace,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return  Row(
                        children: [
                          CustomIcon(icon: Icons.alarm),
                          Text('11:00 AM'),
                          CustomContainerMedicine(
                            name: MentorMedicineCubit.get(context).getPatientMedicine!.result![index].name,
                            dosage: MentorMedicineCubit.get(context).getPatientMedicine!.result![index].dosage,
                            shape: MentorMedicineCubit.get(context).getPatientMedicine!.result![index].shape,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return 30.verticalSpace;
                    },
                    itemCount: MentorMedicineCubit.get(context).getPatientMedicine!.result!.length,
                  ),
                  30.verticalSpace,
                  // Text(
                  //   'After Meals',
                  //   style: Styles.size16_700Black,
                  // ),
                  // 30.verticalSpace,
                  // ListView.separated(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index){
                  //     return const Row(
                  //       children: [
                  //         CustomIcon(icon: Icons.alarm),
                  //         Text('11:00 AM'),
                  //         CustomContainerMedicine(),
                  //       ],
                  //     );
                  //   },
                  //   separatorBuilder: (condex, index){
                  //     return 30.verticalSpace;
                  //   },
                  //   itemCount: 10,
                  // ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
