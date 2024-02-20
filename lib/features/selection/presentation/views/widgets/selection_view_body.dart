import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_blueButton.dart';

class SelectionViewBody extends StatefulWidget {
  const SelectionViewBody({super.key});

  @override
  State<SelectionViewBody> createState() => _SelectionViewBodyState();
}
class _SelectionViewBodyState extends State<SelectionViewBody> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h,),
        child:  Column(
          children: [
             SizedBox(
               height: MediaQuery.sizeOf(context).height / 2.2,
               child: const Image(
                  image: AssetImage(
                    AppAssets.selection,
                  ),
               ),
             ),
            Text(
              'Let’s Get Started',
              style: Styles.size24_700Black,
            ),
            15.verticalSpace,
            Text(
             'Login to enjoy the features we’ve provided',
             style: Styles.size16_400Grey757474,
           ),
            30.verticalSpace,
            CustomBlueButton(
                text:'Mentor' ,
                ontap: (){
                  setState(() {
                    role = 'Mentor';
                  });
                  GoRouter.of(context).push(AppRouter.kLogin);
                  },
                containerHeight: 60
            ),
            30.verticalSpace,
            CustomBlueButton(
                text:'Patient',
                ontap: () {
                  setState(() {
                    role = 'Patient';
                  });
                  print(role);
                  GoRouter.of(context).push(AppRouter.kLogin);
                  },
                containerHeight: 60
            ),
          ],
            ),
      ),
    );
  }
}
