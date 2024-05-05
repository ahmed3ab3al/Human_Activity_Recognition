import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_icon.dart';
import 'custom_container_medicine.dart';

class MedicineViewBody extends StatelessWidget {
  const MedicineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          'Before Meals',
          style: Styles.size16_700Black,
        ),
        30.verticalSpace,

        // Should Be In List
        const Row(
          children: [
            CustomIcon(icon: Icons.alarm),
            Text('11:00 AM'),
            CustomContainerMedicine(),
          ],
        ),

        30.verticalSpace,
        Text('After Meals', style: Styles.size16_700Black),
        20.verticalSpace,
        const Row(
          children: [
            CustomIcon(icon: Icons.alarm),
            Text('11:00 AM'),
            CustomContainerMedicine(),
          ],
        ),
        30.verticalSpace,
        const Row(
          children: [
            CustomIcon(icon: Icons.alarm),
            Text('11:00 AM'),
            CustomContainerMedicine(),
          ],
        ),
      ],
    );
  }
}
