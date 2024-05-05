import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/utils/styles.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_icon.dart';

class ProfileDataViewBody extends StatelessWidget {
  const ProfileDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E4CA1),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 17,
            color: ColorManager.whiteColor,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            // height: 774,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff0E4CA1),
                Color(0xff67A3F4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 4.1,
            child: Text(
              CacheHelper().getData(key: userName),
              style: Styles.testStyle20,
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 16,
            child: SizedBox(
              width: 130,
              height: 130,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage:
                    const NetworkImage('https://i.pravatar.cc/300'),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(children: [
                const Divider(
                  color: Colors.white,
                  height: 10,
                ),
                Row(
                  children: [
                    const CustomIcon(icon: Icons.person),
                    Text(
                      'ID',
                      style: Styles.size16_700Black,
                    ),
                    const Spacer(),
                    Text(
                      CacheHelper().getData(key: userId),
                      style: Styles.size16_700Black,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    height: 15,
                  ),
                ),
                Row(
                  children: [
                    const CustomIcon(icon: Icons.person),
                    Text(
                      'Number',
                      style: Styles.size16_700Black,
                    ),
                    const Spacer(),
                    Text(
                      CacheHelper().getData(key: userPhone),
                      style: Styles.size16_700Black,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    height: 15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    CacheHelper().saveData(key: token, value: '');
                    GoRouter.of(context).pushReplacement(AppRouter.kLogin);
                  },
                  child: Row(
                    children: [
                      const CustomIcon(icon: Icons.logout_outlined),
                      Text(
                        'Logout',
                        style: Styles.size16_700Black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBlueButton(
                    text: 'Edit Profile',
                    ontap: () {
                      GoRouter.of(context).push(AppRouter.kEditProfile);
                    },
                    containerHeight: 50)
              ]),
            ),
          )
        ],
      ),
    );
  }
}
