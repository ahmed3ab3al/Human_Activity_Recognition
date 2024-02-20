import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/toggle_counter_button.dart';

import '../../../../../core/utils/colors.dart';

class MedicineInformation extends StatelessWidget {
  const MedicineInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
            208.horizontalSpace,
            Text(
              'EveryDay',
              style: Styles.testStyle15.copyWith(color: ColorManager.greyColor757474),
            )
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
            Container(
              width: 100.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    width: 1.w, color: ColorManager.greyColorD9D9D9),
              ),
              child: const Center(
                  child: Text(
                      '+ New Time'
                  )
              ),
            ),
          ],
        ),
      ],
    );
  }
}
