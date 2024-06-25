import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/patient_chats_items.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/search_form_field.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/styles.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Messages',
                      style: Styles.size16_700Black,
                    )
                  ],
                ),
                20.verticalSpace,
                SearchTextFormFiled(
                  hint: 'Search Chat',
                  customController: searchController,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kChatDetails);
                    },
                      child: const BuildChatsItem()
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
