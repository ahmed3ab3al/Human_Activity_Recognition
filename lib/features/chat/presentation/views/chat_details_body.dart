import 'package:flutter/material.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_details_appbar.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_messages.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_typing.dart';


class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Builder(
      builder: (BuildContext context) {
        return const Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ChatDetailsAppBar(),
                  ChatMessages(),
                  SizedBox(
                    height: 20,
                  ),
                  ChatTyping(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

