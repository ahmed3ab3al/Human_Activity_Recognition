import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_information.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/toggle_button.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_loading_item.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../view_models/medicine_cubit/medicine_cubit.dart';
import '../../view_models/medicine_cubit/medicine_state.dart';
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
    return BlocConsumer<MedicineCubit, MedicineStates>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.message)),
            ),
          );
          MedicineCubit.get(context).getPatientsMedicine(patientID: patientID);
          GoRouter.of(context).pop();
        } else if (state is AddMedicineError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.error)),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    tab: () {
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
                  const Center(child: MedicineList()),
                  20.verticalSpace,
                  const LineContainer(),
                  30.verticalSpace,
                  const GestureDetectorToggle(),
                  30.verticalSpace,
                  const LineContainer(),
                  40.verticalSpace,
                  const MedicineInformation(),
                  60.verticalSpace,
                  state is AddMedicineLoading
                      ? CustomLoadingItem(
                          width: MediaQuery.sizeOf(context).width / 1.1,
                          height: MediaQuery.sizeOf(context).height / 15,
                        )
                      : CustomBlueButton(
                          text: 'Reminder',
                          ontap: () {
                            MedicineCubit.get(context).addMedicine(
                              patientID: patientID,
                              nameOfMedicine: medicineController.text,
                            );
                          },
                          containerHeight: 56)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
