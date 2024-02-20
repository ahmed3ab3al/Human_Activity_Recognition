import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';


// ignore: must_be_immutable
class CustomFloatingActionButton extends StatelessWidget {
   IconData icon= Icons.add;
  final GestureTapCallback tab;
   CustomFloatingActionButton({super.key,
    required this.icon, required this.tab});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: tab,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [
                Color(0xff0E4CA1),
                Color(0xff67A3F4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              ),
            ),
            child:  CircleAvatar(
              maxRadius: 32.r,
              backgroundColor: Colors.transparent,
              child:  Icon(icon,color: ColorManager.whiteColor,),
            ),
          ),
        );
  }
}
