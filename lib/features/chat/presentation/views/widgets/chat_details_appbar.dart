import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ChatDetailsAppBar extends StatelessWidget {
  const ChatDetailsAppBar({super.key, required this.name});

  final name;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
            ChatCubit.get(context).getChat(back: true);
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
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
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
              '$name',
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
