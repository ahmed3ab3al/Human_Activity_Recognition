import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_details_appbar.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_messages.dart';
import 'package:graduation_project/features/chat/presentation/views/widgets/chat_typing.dart';


class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key,required this.name,
  });

  final name;
  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatCubit.get(context).getMessageSocket();
    ChatCubit.get(context).getMessages();
  }
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
                    name: widget.name,
                  ),
                  const ChatMessages(),
                  const SizedBox(
                    height: 20,
                  ),
                   ChatTyping(
                    id: CacheHelper().getData(key: userRole) == 'mentor' ? patientID: mentorID,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

