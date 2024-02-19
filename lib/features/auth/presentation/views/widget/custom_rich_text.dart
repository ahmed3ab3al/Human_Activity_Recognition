import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: 'I agree to the app ',
          style: Styles.size14_400Black,
          children: <TextSpan>[
            TextSpan(
              text: 'Terms and Services',
              style: Styles.size14_400Blue0E4CA1,
            ),
            TextSpan(
              text: ' and',
              style: Styles.size14_400Black,
            ),
            TextSpan(
              text: ' Privacy Policy',
              style: Styles.size14_400Blue0E4CA1,
            ),
          ],
        ),
      ),
    );
  }
}
