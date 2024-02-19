import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_blueButton.dart';



class SelectionViewBody extends StatelessWidget {
  const SelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h,),
        child:  Column(
          children: [
            const Image(image: AssetImage('images/selection.png')),
            Text('Let’s Get Started',style: Styles.size24_700Black,),
           15.verticalSpace,
           Text('Login to enjoy the features we’ve provided',style: Styles.size16_400Grey757474,),
            30.verticalSpace,
            CustomBlueButton(text:'Mentor' , ontap: (){
              GoRouter.of(context).push(AppRouter.kLogin);
            }, containerHeight: 60),
            30.verticalSpace,
            CustomBlueButton(text:'Patient', ontap: (){
              GoRouter.of(context).push(AppRouter.kLogin);
            }, containerHeight: 60),
          ],
            ),
      ),
    );
  }
}
