import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_check_box.dart';
import 'custom_rich_text.dart';

class CheckPrivacy extends StatelessWidget {
  const CheckPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckBox(),
        CustomRichText(),
      ],
    );
  }
}
