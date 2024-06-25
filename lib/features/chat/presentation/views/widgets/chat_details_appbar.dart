import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ChatDetailsAppBar extends StatelessWidget {
  const ChatDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManager.greyColor757474,
            size: 20,
          ),
        ),
        const Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('images/vitamin_a.png'),
            ),
            Positioned(
              left: 40,
              top: 35,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 5,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohammed Ashraf',
              style: Styles.testStyle14Bold,
            ),
            Text(
              'Online',
              style: Styles.size16_400Grey757474.copyWith(fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
