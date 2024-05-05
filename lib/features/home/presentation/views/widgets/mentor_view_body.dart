import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/patients_list_view.dart';
import 'image_text_welcome.dart';
import 'name_profile_row.dart';

class MentorViewBody extends StatelessWidget {
  const MentorViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 40.h),
          child: Column(
            children: [
              const ImageText(),
              const NameProfileRow(),
              15.verticalSpace,
              const PatientListView(),
            ],
          ),
        ),
      ),
    );
  }
}
