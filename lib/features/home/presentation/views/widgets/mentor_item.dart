import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../medicine/presentation/views/widgets/line_container.dart';
import '../../view_models/patient_cubit/patient_cubit.dart';

class MentorItem extends StatelessWidget {
  const MentorItem({
    super.key,
    required this.name,
    required this.id,
  });

  final name;
  final id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 25,
            ),
            CircleAvatar(
              radius: 30.r,
              backgroundImage: AssetImage(anotherImage),
              backgroundColor: Colors.blue,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 15,
            ),
            Flexible(
              flex: 100,
              child: Text(
                name,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 6,
            ),
            GestureDetector(
              onTap: () {
                PatientCubit.get(context).confirmRequest(id);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff0E4CA1),
                      Color(0xff67A3F4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.check,
                  size: 20.sp,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 15,
            ),
            GestureDetector(
              onTap: () {
                PatientCubit.get(context).declineRequest(id);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0E4CA1),
                        Color(0xff67A3F4),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.circle),
                child: Icon(
                  FontAwesomeIcons.xmark,
                  color: ColorManager.whiteColor,
                  size: 20.sp,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 20,
            ),
          ],
        ),
        15.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: const LineContainer(),
        ),
      ],
    );
  }
}
