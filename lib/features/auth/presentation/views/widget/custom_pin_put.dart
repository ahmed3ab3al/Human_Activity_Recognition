import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/utils/styles.dart';

class PinPutView extends StatelessWidget {
  const PinPutView({
    super.key,
    required this.otpController,
  });

  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Pinput(
            defaultPinTheme: PinTheme(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                height: 50.h,
                width: 35.w,
                textStyle: Styles.size24_700Black),
            focusedPinTheme: PinTheme(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(.5))),
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                height: 55.h,
                width: 35.w,
                textStyle: Styles.size24_700Black),
            length: 6,
            controller: otpController,
            toolbarEnabled: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onCompleted: (pin) async {
              otpController.text = pin;
            }),
      ],
    );
  }
}
