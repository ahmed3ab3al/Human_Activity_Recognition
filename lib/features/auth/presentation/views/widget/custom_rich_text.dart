import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
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
          style: Styles.testStyle14.copyWith(color: ColorManager.blackColor),
          children: <TextSpan>[
            TextSpan(
              text: 'Terms and Services',
              style: Styles.testStyle14
                  .copyWith(color: ColorManager.blueColor0E4CA1),
            ),
            TextSpan(
              text: ' and',
              style:
                  Styles.testStyle14.copyWith(color: ColorManager.blackColor),
            ),
            TextSpan(
              text: ' Privacy Policy',
              style: Styles.testStyle14
                  .copyWith(color: ColorManager.blueColor0E4CA1),
            ),
          ],
        ),
      ),
    );
  }
}
