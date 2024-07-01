import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/colors.dart';

class BuildMyMessage extends StatelessWidget {
  const BuildMyMessage({super.key, required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: const BoxDecoration(
          color: Color(0xff468CF7),
          // gradient: const LinearGradient(
          //   colors: [
          //     // 0xff0E4CA1
          //     Color(0xff468CF7),
          //     Color(0xff67A3F4),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          ),
        ),
        child:  Text(
          message,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
