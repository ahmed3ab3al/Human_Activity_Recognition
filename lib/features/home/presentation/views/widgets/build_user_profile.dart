import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/custom_user_profile.dart';

class BuildProfile extends StatelessWidget {
  const BuildProfile({super.key, required this.Tab});
  final GestureTapCallback Tab;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
            context, index,
            ) {
          return  SizedBox(
            height: 20.h,
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return  UserprofileItemWidget(tab: Tab,);
        },
      );
    }

  }

