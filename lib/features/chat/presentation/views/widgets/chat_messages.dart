import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/build_another_message.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/build_my_message.dart';

import 'chat_details_loading.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});
  @override
  Widget build(BuildContext context) {
    final List<int> loading = [
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2,
      1,
      2
    ];
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state is GetMessageLoading || ChatCubit.get(context).messagesModel == null
            ? Expanded(
                child: ListView.separated(
                  physics: const ScrollPhysics(),
                  reverse: true,
                  itemBuilder: (context, index) {
                    if (loading[index] == 1) {
                      return const MyChatDetailsLoading();
                    }
                    return AnotherChatDetailsLoading();
                  },
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  addAutomaticKeepAlives: true,
                  cacheExtent: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: loading.length,
                ),
              )
            :ChatCubit.get(context).messagesModel!.results!.isEmpty ? Container(): Expanded(
                child: ListView.separated(
                  physics: const ScrollPhysics(),
                  reverse: true,
                  itemBuilder: (context, index) {
                    var message = ChatCubit.get(context)
                        .messagesModel!
                        .results!
                        .reversed
                        .toList()[index];
                    if (CacheHelper().getData(key: userId) == message.sender) {
                      return BuildMyMessage(message: message.content!);
                    }
                    return BuildAnotherMessage(message: message.content!);
                  },
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  addAutomaticKeepAlives: true,
                  cacheExtent: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount:
                      ChatCubit.get(context).messagesModel!.results!.length,
                ),
              ) ;
      },
    );
  }
}
