import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class ORTextView extends StatelessWidget {
  const ORTextView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '-OR-',
          style: TextStyle(
              color:  ColorManager.greyColor757474,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
