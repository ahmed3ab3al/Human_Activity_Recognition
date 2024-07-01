import 'package:flutter/material.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_details_appbar.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_messages.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_typing.dart';


class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key,required this.name,
  });

  final name;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return  Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ChatDetailsAppBar(
                    name: name,
                  ),
                  const ChatMessages(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ChatTyping(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

