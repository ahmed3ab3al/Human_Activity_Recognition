import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_view_body.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_appBar.dart';

class MentorMedicineViewBody extends StatelessWidget {
  const MentorMedicineViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 30.h),
          child: Column(
            children: [
              CustomAppBar(
                tab: () {
                  GoRouter.of(context).push(AppRouter.kBackHome);
                },
                text: 'Treatment registration',
                space: 20,
              ),
              const MedicineViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
