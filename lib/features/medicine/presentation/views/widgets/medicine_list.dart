import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/assets.dart';

import '../../../../../core/utils/colors.dart';

class MedicineList extends StatefulWidget {
  const MedicineList({super.key});

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  final List<String> images = [
    AppAssets.vitamin,
    AppAssets.trioClar,
    AppAssets.vitaminC,
    AppAssets.injection,
  ];

  final List<int> selectedItems = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                  if (selectedItems.contains(index)) {
                    selectedItems.remove(index);
                  } else {
                    selectedItems.add(index);
                  }
                });
                },
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 50.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: ColorManager.greyColorEEEEEE,
                        width: 1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(
                            1,
                            2,
                          ),
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(images[index]),
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                  selectedItems.contains(index)
                      ? Positioned(
                          bottom: 40.h,
                          left: 35.w,
                          child: CircleAvatar(
                            radius: 7.r,
                            backgroundColor: Colors.greenAccent,
                            child: Icon(
                              Icons.check,
                              size: 14.w,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(),
                ]),
              ),
          separatorBuilder: (context, index) => 42.horizontalSpace,
          itemCount: images.length),
    );
  }
}

// if (selectedItems.contains(index)) {
//   selectedItems.remove(index);
// } else {
//   selectedItems.add(index);
// }
