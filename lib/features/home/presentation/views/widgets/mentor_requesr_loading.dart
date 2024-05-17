import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_loading_item.dart';

class MentorRequestLoading extends StatelessWidget {
  const MentorRequestLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      itemBuilder: (context,index)=> Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 25,
          ),
          const CustomLoadingItem(
            width: 80,
            height: 80,
            circle: 40,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 15,
          ),
          CustomLoadingItem(
            width: MediaQuery.sizeOf(context).width / 3,
            height: 10,
          ),
          const Spacer(),
          const CustomLoadingItem(
            width: 20,
            height: 20,
            circle: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 15,
          ),
          const CustomLoadingItem(
            width: 20,
            height: 20,
            circle: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 20,
          ),
        ],
      ),
      separatorBuilder: (context, index) =>
      10.verticalSpace,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
