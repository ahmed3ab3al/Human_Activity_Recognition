import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_blue_button.dart';
import '../../../../../core/widgets/custom_icon.dart';

class ProfileDataViewBody extends StatelessWidget {
  const ProfileDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:

          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 774,
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
                  //           SizedBox(
                  //   width: 130,
                  //   height: 130,
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.grey.shade200,
                  //     backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  //     child: Stack(
                  //       children: [
                  //         Positioned(
                  //           bottom: 5,
                  //           right: 5,
                  //           child: GestureDetector(
                  //             onTap: () async {},
                  //             child: Container(
                  //               height: 50,
                  //               width: 50,
                  //               decoration: BoxDecoration(
                  //                  color: Colors.white,
                  //                 border: Border.all(color: Colors.white, width: 3),
                  //                 borderRadius: BorderRadius.circular(25),
                  //               ),
                  //               child: const Icon(
                  //                 Icons.camera_alt_outlined,
                  //                 color: Colors.blue,
                  //                 size: 25,
                  //
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  //           SizedBox(
                  //             height: 300,
                  //           ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    height: 230,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                          children: [
                            const Divider(
                              color: Colors.white,
                              height: 10,
                            ),
                             Row(
                              children: [
                                const CustomIcon(icon: Icons.person),
                                const Text('ID'),
                                const Spacer(),
                                Text(CacheHelper().getData(key: userId)),
                              ],
                            ),
                            const Divider(
                              height: 15,
                            ),
                             Row(
                              children: [
                                const CustomIcon(icon: Icons.person),
                                const Text('Name'),
                                const Spacer(),
                                Text(CacheHelper().getData(key: userName)),
                              ],
                            ),
                            const Divider(
                              height: 15,
                            ),
                            const Row(
                              children: [
                                CustomIcon(icon: Icons.logout_outlined),
                                Text('Logout'),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomBlueButton(text: 'Edit Profile', ontap: () {
                              GoRouter.of(context).push(AppRouter.kEditProfile);
                            }, containerHeight: 50)
                          ]),
                    ),
                  )
                ],
              ),
            ],
    ),);

  }
}
