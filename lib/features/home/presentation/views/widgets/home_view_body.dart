import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/build_user_profile.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_textFormField.dart';

import 'image_text_welcome.dart';
import 'name_profile_row.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}
// GoRouter.of(context).push( AppRouter.kBackHome);

class _HomeViewBodyState extends State<HomeViewBody> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var idController = TextEditingController();

  bool isBottomSheetShown = false;
  var formKey = GlobalKey<FormState>();
  IconData fabIcon = Icons.add;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 40.h),
            child: Column(
              children: [
                const ImageText(),
                 NameProfileRow(
                  tab: (){
                     GoRouter.of(context).push( AppRouter.kEditProfile);
                  },
                ),
                15.verticalSpace,
                 BuildProfile(Tab: (){
                   GoRouter.of(context).push( AppRouter.kMentorLayout);
                 },),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        child:  Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff0E4CA1),
                Color(0xff67A3F4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:  CircleAvatar(
            maxRadius: 30.r,
            backgroundColor: Colors.transparent,
            child: Icon(fabIcon,color: Colors.white,),
          ),
        ),
        onTap: () {
          if (isBottomSheetShown) {
            if (formKey.currentState!.validate()) {
              Navigator.pop(context);
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.add;
              });
            }
          } else {
            scaffoldKey.currentState?.showBottomSheet(
                (context) => Form(key: formKey, child:   Container(
                  color: const Color(0xffDEDEDE),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormFiled(
                          hint: 'ID Number',
                          customController: idController,
                          type: TextInputType.number,
                          prefix: Icons.perm_identity_rounded)
                    ],
                  ),
                )),
                elevation: 20);
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.check;
            });
          }
        },
      ),
    );
  }
}