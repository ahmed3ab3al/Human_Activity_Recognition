import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/auth/data/model/update_medicine.dart';
import 'package:graduation_project/features/medicine/presentation/views/update_medicine_view.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../data/get_patient_medicine.dart';
import '../../view_models/medicine_cubit/medicine_cubit.dart';
import 'custom_container_medicine.dart';

class MedicineViewBody extends StatelessWidget {
  const MedicineViewBody({super.key, this.getPatientMedicine});

  final GetPatientMedicine? getPatientMedicine;
  @override
  Widget build(BuildContext context) {
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
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (CacheHelper().getData(key: userRole) == 'mentor') {
                return Dismissible(
                  key: Key(MedicineCubit.get(context)
                      .getPatientMedicine!
                      .result![index]
                      .id!),
                  onDismissed: (direction) {
                    if (CacheHelper().getData(key: userRole) == 'mentor') {
                      MedicineCubit.get(context).deleteMedicine(
                          medicineId: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .id!,
                          index: index);
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      if (CacheHelper().getData(key: userRole) == 'mentor') {
                        UpdateMedicine update = UpdateMedicine(
                          name: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .name!,
                          shape: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .shape!,
                          aftearMeal: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .afterMeal!,
                          dosage: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .dosage!,
                          hour: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .time!
                              .hour,
                          minute: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .time!
                              .minute,
                          system: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .time!
                              .system,
                          id: MedicineCubit.get(context)
                              .getPatientMedicine!
                              .result![index]
                              .id!,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateMedicineView(
                                    updateMedicine: update)));
                      }
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const CustomIcon(icon: Icons.alarm),
                                Text(
                                    '${getPatientMedicine!.result![index].time!.hour}:${getPatientMedicine!.result![index].time!.minute} ${getPatientMedicine!.result![index].time!.system}'),
                              ],
                            ),
                            getPatientMedicine!.result![index].afterMeal!
                                ? Text(
                                    'After Meal',
                                    style: Styles.testStyle14Bold,
                                  )
                                : Text(
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
                    ),
                  ),
                );
              } else {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const CustomIcon(icon: Icons.alarm),
                            Text(
                                '${getPatientMedicine!.result![index].time!.hour}:${getPatientMedicine!.result![index].time!.minute} ${getPatientMedicine!.result![index].time!.system}'),
                          ],
                        ),
                        getPatientMedicine!.result![index].afterMeal!
                            ? Text(
                                'After Meal',
                                style: Styles.testStyle14Bold,
                              )
                            : Text(
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
              }
            },
            separatorBuilder: (context, index) {
              return 30.verticalSpace;
            },
            itemCount:
                MedicineCubit.get(context).getPatientMedicine!.result!.length,
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
