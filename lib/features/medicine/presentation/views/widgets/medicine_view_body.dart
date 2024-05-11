import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/mentor_medicine_cubit/mentor_medicine_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../data/GetPatientMedicine.dart';
import 'custom_container_medicine.dart';

class MedicineViewBody extends StatelessWidget {
  const MedicineViewBody({super.key,  this.getPatientMedicine});

  final GetPatientMedicine? getPatientMedicine;
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
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
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return  Row(
                children: [
                   Column(

                    children: [
                      const Row(
                        children: [
                          CustomIcon(icon: Icons.alarm),
                          Text('11:00 AM'),
                        ],
                      ),
                      getPatientMedicine!.result![index].afterMeal! ?
                      Text(
                        'After Meal',
                        style: Styles.testStyle14Bold,
                      ):
                      Text(
                        'Before Meal',
                        style: Styles.testStyle14Bold,
                      ),
                    ],
                  ),
                  CustomContainerMedicine(
                    name: getPatientMedicine!.result![index].name,
                    dosage: getPatientMedicine!.result![index].dosage,
                    shape: getPatientMedicine!.result![index].shape,
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
        ],
      ),
    );
  }
}
