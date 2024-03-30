import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/features/on_boarding/presentation/views/widgets/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingViewBody> {
  final boardController = PageController();
  String text='Next';
  List<BoardingModel> boarding = [
    BoardingModel(
        body: 'Recognize the activity',
        image: AppAssets.onBoardingOne,
        title1: 'We can detect human activity,',
        title2: 'especially falls'),
    BoardingModel(
        body: 'Treatment Reminder',
        image: AppAssets.onBoardingTwo,
        title1: 'Easy of entering and finding',
        title2: 'treatment appointments'),
    BoardingModel(
        body: 'Easy Communication',
        image: AppAssets.onBoardingThree,
        title1: 'Chat app fast and powerful than',
        title2: ' any other application'),
    BoardingModel(
        body: 'Easy To Find Location',
        image: AppAssets.onBoardingFour,
        title1: 'Finding location all over the world',
        title2: ''),
  ];

  bool isLast = false;
  final controller = PageController(viewportFraction: .8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child:  Text(
                      'Skip',
                    style:Styles.size16_400Grey757474,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kSelection);
                    },
                  ),
                ),
                 10.verticalSpace,
                Expanded(
                  child: PageView.builder(
                    controller: boardController,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                          text='Get Started';
                        });
                      } else {
                        setState(() {
                          isLast = false;
                          text='Next';
                        });
                      }
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        OnBoardingItem(model: boarding[index],),
                    itemCount: boarding.length,
                  ),
                ),
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 2,
                      activeDotColor: Color(0xff0E4CA1),
                      dotColor: Color(0xff67A3F4),
                      spacing: 5
                  ),
                ),
                60.verticalSpace,
                CustomBlueButton(
                  containerHeight: 60,
                  text: text,
                  ontap: () {
                    if (isLast) {
                      GoRouter.of(context).push( AppRouter.kSelection);

                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                ),
                80.verticalSpace
              ],
            ),
          ),
    );
  }
}


