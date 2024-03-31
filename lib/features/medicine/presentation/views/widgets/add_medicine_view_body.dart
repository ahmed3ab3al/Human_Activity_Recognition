import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_information.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/toggle_button.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'line_container.dart';
import 'medicine_list.dart';

class AddMedicineViewBody extends StatefulWidget {
  const AddMedicineViewBody({super.key});

  @override
  State<AddMedicineViewBody> createState() => _AddMedicineViewBodyState();
}

class _AddMedicineViewBodyState extends State<AddMedicineViewBody> {
  var medicineController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                'Select Shape',
                style: Styles.size16_700Black,
              ),
              15.verticalSpace,
              Center(
                  child: MedicineList()
              ),
              20.verticalSpace,
              const LineContainer(),
              30.verticalSpace,
              const GestureDetectorToggle(),
              30.verticalSpace,
              const LineContainer(),
              40.verticalSpace,
              const MedicineInformation(),
              60.verticalSpace,
              CustomBlueButton(
                  text: 'Reminder', ontap: () {
                GoRouter.of(context).pop();
              }, containerHeight: 56)
            ],
          ),
        ),
      ),
    );
  }
}
