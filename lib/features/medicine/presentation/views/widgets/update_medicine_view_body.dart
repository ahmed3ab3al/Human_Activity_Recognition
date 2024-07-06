import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widgets/custom_loading_item.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/auth/data/model/update_medicine.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/medicine_cubit/medicine_cubit.dart';
import 'package:graduation_project/features/medicine/presentation/view_models/medicine_cubit/medicine_state.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/line_container.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_information.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_list.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/toggle_button.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_blue_button.dart';

class UpdateMedicineViewBody extends StatefulWidget {
  const UpdateMedicineViewBody({super.key, required this.updateMedicine});

  final UpdateMedicine updateMedicine;

  @override
  State<UpdateMedicineViewBody> createState() => _UpdateMedicineViewBodyState();
}

class _UpdateMedicineViewBodyState extends State<UpdateMedicineViewBody> {
  var medicineController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    MedicineCubit.get(context).hours = widget.updateMedicine.hour;
    MedicineCubit.get(context).minute = widget.updateMedicine.minute;
    MedicineCubit.get(context).system = widget.updateMedicine.system;
    MedicineCubit.get(context).isAfterMeal = widget.updateMedicine.aftearMeal;
    MedicineCubit.get(context).dosage = widget.updateMedicine.dosage;
    MedicineCubit.get(context).selectDragItem(widget.updateMedicine.shape);
    medicineController.text = widget.updateMedicine.name;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return BlocConsumer<MedicineCubit, MedicineStates>(
      listener: (context, state) {
        if (state is UpdateMedicineSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.message)),
            ),
          );
          MedicineCubit.get(context).getPatientsMedicine(patientID: patientID);
          GoRouter.of(context).pop();
        } else if (state is UpdateMedicineError) {
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
                    text: 'Update Medication',
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
                  const Center(
                      child: MedicineList()
                  ),
                  20.verticalSpace,
                  const LineContainer(),
                  30.verticalSpace,
                  const GestureDetectorToggle(),
                  30.verticalSpace,
                  const LineContainer(),
                  40.verticalSpace,
                  const MedicineInformation(
                    update: true,
                  ),
                  60.verticalSpace,
                  state is UpdateMedicineLoading
                      ? CustomLoadingItem(
                    width: MediaQuery.sizeOf(context).width / 1.1,
                    height: MediaQuery.sizeOf(context).height / 15,
                  )
                      : CustomBlueButton(
                      text: 'Update',
                      ontap: () {
                        MedicineCubit.get(context).updateMedicine(
                          medicineId: widget.updateMedicine.id,
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
