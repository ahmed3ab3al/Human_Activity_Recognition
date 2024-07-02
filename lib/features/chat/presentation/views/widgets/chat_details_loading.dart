import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_loading_item.dart';

class AnotherChatDetailsLoading extends StatelessWidget {
  const AnotherChatDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomLoadingItem(
            height: 25,
            width: 90,
          ),
        ),
      ],
    );
  }
}

class MyChatDetailsLoading extends StatelessWidget {
  const MyChatDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: CustomLoadingItem(
            height: 25,
            width: 90,
          ),
        ),
      ],
    );
  }
}
