import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/socket/socket.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';
import '../../../../../core/utils/colors.dart';

class ChatTyping extends StatelessWidget {
  const ChatTyping({
    super.key,
    required this.id,
  });

  final id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 20),
                  child: TextFormField(
                    controller: ChatCubit.get(context).message,
                    cursorColor: ColorManager.blueColor0E4CA1,
                    decoration: InputDecoration(
                      hintText: 'Aa...',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          // Set the border color when focused
                          width: 2.0,
                        ),
                      ),
                    ),
                    // controller: textController,
                  ),
                ),
              ),
              InkWell(
                radius: 25,
                onTap: () {
                  AppSocket.sendMessageSocket(
                      id: id, message: ChatCubit.get(context).message.text);
                  ChatCubit.get(context).sendMessage();
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: ColorManager.blueColor0E4CA1,
                  child: Center(
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
