import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/styles.dart';
import '../../../../../constants.dart';

class NameProfileRow extends StatelessWidget {
  const NameProfileRow({super.key, required this.tab});
final GestureTapCallback tab;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        12.horizontalSpace,
         Text('Ahmed Alaa',style: Styles.size16_700Black,),
        const Spacer(),
        GestureDetector(
          onTap: tab,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: ColorManager.greyColorD9D9D9,
            child:  Icon(Icons.perm_identity_rounded, size: 24.sp),
          ),
        )
      ],
    );
  }
}
