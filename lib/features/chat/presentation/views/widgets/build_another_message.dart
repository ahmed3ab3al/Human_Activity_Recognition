import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/colors.dart';

class BuildAnotherMessage extends StatelessWidget {
  const BuildAnotherMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: const BoxDecoration(
          color: ColorManager.greyColorEEEEEE,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: ColorManager.greyColor757474),
        ),
      ),
    );
  }
}
