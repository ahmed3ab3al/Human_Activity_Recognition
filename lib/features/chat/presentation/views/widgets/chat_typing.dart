import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class ChatTyping extends StatelessWidget {
  const ChatTyping({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,right: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              padding: const EdgeInsetsDirectional.only(start: 10,end: 20),
              child: TextFormField(
                cursorColor: ColorManager.blueColor0E4CA1,
                decoration:   InputDecoration(
                  hintText: 'Aa...',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color when focused
                      width: 2.0,
                    ),
                  ),
                ),
                // controller: textController,
              ),
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager.blueColor0E4CA1,
            child: Center(
              child: MaterialButton(
                  minWidth: 1,
                  onPressed: (){
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
