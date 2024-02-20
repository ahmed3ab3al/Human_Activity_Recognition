import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5.h,
      width: double.infinity,
      color: ColorManager.greyColorEEEEEE,
    );
  }
}
