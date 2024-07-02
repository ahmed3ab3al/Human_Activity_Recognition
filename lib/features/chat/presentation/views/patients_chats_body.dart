import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_loading.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/patient_chats_items.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/search_form_field.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/styles.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController =
        RefreshController(initialRefresh: false);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          onRefresh: () {
            ChatCubit.get(context).refreshPatientsChat(refreshController);
          },
          child: SingleChildScrollView(
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
                      if (state is GetChatError)
                        Center(
                          child: Text(
                            state.error.toString(),
                          ),
                        ),
                      state is GetChatSuccess &&
                              ChatCubit.get(context).chatModel!.results!.isEmpty
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height / 3.5),
                              child: Center(
                                child: Text(
                                  "Not Chat Yet",
                                  style: Styles.size16_700Black,
                                ),
                              ),
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  mentorID = ChatCubit.get(context)
                                      .chatModel!
                                      .results![0]
                                      .members![index]
                                      .id!;
                                  GoRouter.of(context).push(
                                    AppRouter.kChatDetails,
                                    extra: ChatCubit.get(context)
                                        .chatModel!
                                        .results![0]
                                        .members![index]
                                        .name!,
                                  );
                                },
                                child: state is GetChatLoading
                                    ? const ChatLoading()
                                    : ChatCubit.get(context)
                                                .chatModel!
                                                .results![0]
                                                .members![index]
                                                .id !=
                                            CacheHelper().getData(key: userId)
                                        ? BuildChatsItem(
                                            name: ChatCubit.get(context)
                                                .chatModel!
                                                .results![0]
                                                .members![index]
                                                .name!,
                                            message: ChatCubit.get(context)
                                                .chatModel!
                                                .results![0]
                                                .lastMesssage!,
                                            time: ChatCubit.get(context)
                                                .chatModel!
                                                .results![0]
                                                .updatedAt!,
                                          )
                                        : Container(),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20.0,
                              ),
                              itemCount: state is GetChatLoading
                                  ? 10
                                  : ChatCubit.get(context)
                                      .chatModel!
                                      .results![0]
                                      .members!
                                      .length,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
