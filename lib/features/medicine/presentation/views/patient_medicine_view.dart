import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/medicine_view_body.dart';
import '../../../home/presentation/views/widgets/image_text_welcome.dart';
import '../../../home/presentation/views/widgets/name_profile_row.dart';

class PatientMedicineView extends StatelessWidget {
  const PatientMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
          child: Column(
            children: [
              const ImageText(),
              5.verticalSpace,
              const NameProfileRow(),
              const MedicineViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
