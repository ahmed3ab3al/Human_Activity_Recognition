import 'package:flutter/material.dart';

class BuilsMyMessage extends StatelessWidget {
  const BuilsMyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          ),
        ),
        child: const Text(
          'messageModel.text!',
        ),
      ),
    );
  }
}
