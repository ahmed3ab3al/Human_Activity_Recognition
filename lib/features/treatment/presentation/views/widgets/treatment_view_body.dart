import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_icon.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'custom_container_medicine.dart';
import 'custom_floating_button.dart';

class TreatmentRegistrationViewBody extends StatelessWidget {
  const TreatmentRegistrationViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 30.h),
          child: Column(
            children: [
               CustomAppBar(
                tab: (){
                  GoRouter.of(context).push( AppRouter.kBackHome);
                },
                text: 'Treatment registration',
                space: 20,
              ),
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
                  onDateChange: (date){
                  //  selected=date;
                  },

                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Before Meals',
                    style: Styles.size16_700Black,
                  ),
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
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('After Meals', style: Styles.size16_700Black),
                ],
              ),
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
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomFloatingActionButton(
                    tab: (){
                      GoRouter.of(context).push( AppRouter.kAddMedicine);
                    },
                    icon: Icons.add,
                  ),
                  15.horizontalSpace
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
