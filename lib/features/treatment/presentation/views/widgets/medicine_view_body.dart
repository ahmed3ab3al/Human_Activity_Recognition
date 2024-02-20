import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/treatment/presentation/views/widgets/medicine_list.dart';
import 'package:graduation_project/features/treatment/presentation/views/widgets/toggle_button.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blueButton.dart';
import '../../../../../core/widgets/custom_textFormField.dart';
import 'line_container.dart';
import 'toggle_counter_button.dart';

class MedicineViewBody extends StatefulWidget {
  const MedicineViewBody({super.key});

  @override
  State<MedicineViewBody> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<MedicineViewBody> {
  var medicineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
               CustomAppBar(
                tab: (){
                  GoRouter.of(context).pop();
                },
                text: 'Add Medication',
                space: 50,
              ),
              15.verticalSpace,
              CustomTextFormFiled(
                hint: 'Medicine',
                customController: medicineController,
                type: TextInputType.text,
                prefix: Icons.medication_rounded,
              ),
              20.verticalSpace,
              const LineContainer(),
              10.verticalSpace,
              Row(
                children: [
                  Text(
                    'Select Shape',
                    style: Styles.size16_700Black,
                  )
                ],
              ),
              15.verticalSpace,
              MedicineList(),
              20.verticalSpace,
              const LineContainer(),
              30.verticalSpace,
              const GestureDetectorToggle(),
              30.verticalSpace,
              const LineContainer(),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dosage',
                    style: Styles.size16_700Black,
                  ),
                  193.horizontalSpace,
                  const GestureDetectorToggleCounter()
                ],
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Repeat for',
                    style: Styles.size16_700Black,
                  ),
                  208.horizontalSpace,
                  GestureDetector(
                      child: Text(
                        'EveryDay',
                        style: Styles.testStyle15.copyWith(color: ColorManager.greyColor757474),
                      ))
                ],
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: Styles.size16_700Black,
                  ),
                  210.horizontalSpace,
                  GestureDetector(
                      child: Container(
                        width: 100.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              width: 1.w, color: ColorManager.greyColorD9D9D9),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('+ New Time'),
                          ],
                        ),
                      )),
                ],
              ),
              60.verticalSpace,
              CustomBlueButton(
                  text: 'Reminder', ontap: () {
                GoRouter.of(context).push( AppRouter.kMentorLayout);

              }, containerHeight: 56)
            ],
          ),
        ),
      ),
    );
  }
}
