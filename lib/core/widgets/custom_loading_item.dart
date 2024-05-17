import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingItem extends StatelessWidget {
  const CustomLoadingItem({super.key, required this.width, required this.height, this.circle = 15});
  final double width;
  final double height;
  final double circle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child: Container(
          padding: const EdgeInsetsDirectional.all(20),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius:  BorderRadius.all(Radius.circular(circle)),
          ),
        ),
      ),
    );
  }
}