import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/core/utils/assets.dart';
import '../../../../../constants.dart';
import '../../../../../core/cache/cache_helper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    Future.delayed(const Duration(seconds: 3), () {
      if (CacheHelper().getData(key: 'onBoarding') != null) {
        if (CacheHelper().getData(key: token) != '') {
          if (CacheHelper().getData(key: role) == 'mentor') {
            GoRouter.of(context).push(AppRouter.kBackHome);
          } else if (CacheHelper().getData(key: role) == 'patient') {
            GoRouter.of(context).push(AppRouter.kPatientHome);
          }
        } else {
          GoRouter.of(context).push(AppRouter.kLogin);
        }
      } else {
        GoRouter.of(context).push(AppRouter.kOnBoarding);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            AppAssets.logo,
            height: 300.h,
            width: double.infinity,
          ),
        ),
        // Image(
        //   image: const AssetImage(AppAssets.splash),
        //   height: 300.h,
        //   width: double.infinity,
        // ),
        // SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
