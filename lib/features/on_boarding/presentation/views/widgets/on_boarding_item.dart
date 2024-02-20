import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.model});

  final BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage(
            model.image
        ),
          height: 320.h,width: double.infinity,
        ),
        20.verticalSpace,
        Text(
          model.body,
          style: Styles.size24_700Black,
        ),
        10.verticalSpace,
        Text(
          model.title1,
          style: Styles.size16_400Grey757474,
        ),
        Text(
          model.title2,
          style: Styles.size16_400Grey757474,
        ),
      ],
    );
  }
}
