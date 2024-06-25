import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const ScrollPhysics(),
        reverse: true,
        // addRepaintBoundaries:false ,
        itemBuilder: (context, index) {
          // var message =
          // SocialLayoutCubit.get(context).messages[index];
          // if (SocialLayoutCubit.get(context).userModel!.uId ==
          //     message.senderId) {
          //   return buildMyMessage('message');
          // }
          // return buildMessage('message');
        },
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        addAutomaticKeepAlives:false,
        cacheExtent: 100,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 10,
      ),
    );
  }
}
