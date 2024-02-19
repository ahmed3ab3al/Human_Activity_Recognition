import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_icon.dart';
import 'core/utils/app_router.dart';
import 'features/home/presentation/views/widgets/image_text_welcome.dart';
import 'features/home/presentation/views/widgets/name_profile_row.dart';
import 'features/treatment/presentation/views/widgets/custom_container_medicine.dart';


class FolloweeTreatmentBody extends StatelessWidget {
  const FolloweeTreatmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
          child: Column(
            children: [
              const ImageText(),
              5.verticalSpace,
               NameProfileRow(tab: () {
                 GoRouter.of(context).push(AppRouter.kEditProfile);
               },),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Before Meals', style: Styles.size16_700Black,),
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
            ],
          ),
        ),
      ),
    );
  }
}
