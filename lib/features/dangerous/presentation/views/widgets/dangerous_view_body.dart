import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widgets/custom_appBar.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class DangerousActivityViewBody extends StatefulWidget {
  const DangerousActivityViewBody({super.key});

  @override
  State<DangerousActivityViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<DangerousActivityViewBody> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 30.h,
        ),
        child: Column(children: [
          CustomAppBar(
              text: 'Dangerous Activities',
              space: 35,
              tab: () {
                GoRouter.of(context).push(AppRouter.kBackHome);
              }),
          40.verticalSpace,
          Row(
            children: [
              const CustomCheckBox(),
              6.horizontalSpace,
              Text(
                "Fall",
                style: Styles.size16_700Black,
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              const CustomCheckBox(),
              6.horizontalSpace,
              Text(
                "Sleep",
                style: Styles.size16_700Black,
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              const CustomCheckBox(),
              6.horizontalSpace,
              Text(
                "UpStairs",
                style: Styles.size16_700Black,
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              const CustomCheckBox(),
              6.horizontalSpace,
              Text(
                "DownStairs",
                style: Styles.size16_700Black,
              ),
            ],
          ),
          20.verticalSpace,
          Row(children: [
            const CustomCheckBox(),
            6.horizontalSpace,
            Text(
              "Sit",
              style: Styles.size16_700Black,
            ),
          ]),
          20.verticalSpace,
          Row(
            children: [
              const CustomCheckBox(),
              6.horizontalSpace,
              Text(
                "StandUp",
                style: Styles.size16_700Black,
              ),
            ],
          ),
          40.verticalSpace,
        ]),
      ),
    );
  }
}
