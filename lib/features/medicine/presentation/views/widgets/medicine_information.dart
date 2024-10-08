import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/toggle_counter_button.dart';
import '../../../../../core/utils/colors.dart';
import '../../view_models/medicine_cubit/medicine_cubit.dart';
import '../../view_models/medicine_cubit/medicine_state.dart';

class MedicineInformation extends StatelessWidget {
  const MedicineInformation({super.key, required this.update});
  final bool update;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineStates>(
      builder: (context, state) {
        return Column(
          children: [
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
                180.horizontalSpace,
                Text(
                  '${24 ~/ MedicineCubit.get(context).dosage} hours',
                  style: Styles.testStyle15
                      .copyWith(color: ColorManager.greyColor757474),
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: Styles.size16_700Black,
                ),
                190.horizontalSpace,
                SizedBox(
                  width: 110.w,
                  child: TextFormField(
                    controller:
                        BlocProvider.of<MedicineCubit>(context).timeController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: ColorManager.greyColorD9D9D9),
                      ),
                      hintText: update
                          ? '${MedicineCubit.get(context).hours}:${MedicineCubit.get(context).minute} ${MedicineCubit.get(context).system}'
                          : 'New Time',
                    ),
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value!.hour == 24) {
                          MedicineCubit.get(context).hours = 12;
                        } else if (value.hour > 12) {
                          MedicineCubit.get(context).hours = value.hour % 12;
                        } else {
                          MedicineCubit.get(context).hours = value.hour;
                        }
                        MedicineCubit.get(context).minute = value.minute;
                        MedicineCubit.get(context).system = value.period
                                    .toString()
                                    .substring(
                                        value.period.toString().length - 2,
                                        value.period.toString().length) ==
                                'am'
                            ? 'AM'
                            : 'PM';
                        print(MedicineCubit.get(context).system);
                        MedicineCubit.get(context).timeController.text =
                            value.format(context);
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
