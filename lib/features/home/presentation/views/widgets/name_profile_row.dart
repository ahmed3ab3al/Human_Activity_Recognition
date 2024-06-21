import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/utils/styles.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/colors.dart';

class NameProfileRow extends StatelessWidget {
  const NameProfileRow({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        12.horizontalSpace,
        Text(
          CacheHelper().getData(key: userName),
          style: Styles.testStyle20.copyWith(
            color: ColorManager.blackColor
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kShowProfile);
          },
          child: const CircleAvatar(
            radius: 15.0,
            backgroundImage:
             NetworkImage('https://i.pravatar.cc/300'),

          ),

        ),
        5.horizontalSpace,
      ],
    );
  }
}
