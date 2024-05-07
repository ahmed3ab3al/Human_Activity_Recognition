import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingItem extends StatelessWidget {
  const CustomLoadingItem({super.key, required this.width, required this.height});
  final double width;
  final double height;
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
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}