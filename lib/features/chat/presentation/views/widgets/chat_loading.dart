import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_loading_item.dart';

class ChatLoading extends StatelessWidget {
  const ChatLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomLoadingItem(
          width: 60,
          height: 60,
          circle: 50,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomLoadingItem(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 15.w),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomLoadingItem(
                width: MediaQuery.of(context).size.width / 2, height: 15.w),
          ],
        ),
      ],
    );
  }
}
