import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/features/medicine/presentation/views/widgets/line_container.dart';

import 'core/utils/colors.dart';
import 'core/utils/styles.dart';

class MentorsBody extends StatelessWidget {
  const MentorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mentors',
                    style: Styles.size16_700Black,)
                ],),
              30.verticalSpace,
              ListView.separated(
                  itemBuilder: (context, index) => buildMentorItem(),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  itemCount: 8
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildMentorItem() => Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage('images/vitamin_a.png'),
              backgroundColor: Colors.black,
            ),
            20.horizontalSpace,
            const Text(
              'Eng/Ahmed Alaa',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            100.horizontalSpace,
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(2),
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
                  Icons.check,
                  size: 18.sp,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
            20.horizontalSpace,
            GestureDetector(
              onTap: (){},
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
                  size: 14.sp,
                ),
              ),
            ),


          ],
        ),
    15.verticalSpace,
    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 6.w),
      child: const LineContainer(),
    ),
  ],
);
