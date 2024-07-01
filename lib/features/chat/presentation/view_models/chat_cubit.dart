import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/features/chat/data/models/chat_model.dart';
import 'package:graduation_project/features/chat/data/models/messages_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/errors/exception.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.apiHelper) : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final ApiHelper apiHelper;

  var message = TextEditingController();
  ChatModel? chatModel;
  void getChat({
    required bool back
})async{
    if(!back) {
      emit(GetChatLoading());
    }
      try{
        var response = await apiHelper.get(
            EndPoints.chat
        );
        chatModel = ChatModel.fromJson(response);
        getMessages();
      } on ServerException catch (e) {
        emit(GetChatError(error: e.errorModel.message));
      }
  }

  void refreshPatientsMedicine(RefreshController refreshController) async{
    getChat(back: false);
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  MessagesModel? messagesModel;
  void getMessages()async{
    try{
      final response = await apiHelper.get(
          EndPoints.messages,
        data: {
            'id':chatModel!.results![0].id
        }
      );
      messagesModel = MessagesModel.fromJson(response);
      emit(GetChatSuccess());
    }on ServerException catch (e) {
      emit(GetChatError(error: e.errorModel.message));
    }
  }

  void sendMessage() async{
    emit(SendMessageLoading());
    try{
      await apiHelper.post(
        EndPoints.sendMessage,
        data: {
          'content' : message.text,
          'id' : '668237845a5656aa48ce4331'
        }
      );
      message.text = '';
      getMessages();
      emit(SendMessageSuccess());
    }on ServerException catch (e) {
      emit(SendMessageError(error: e.errorModel.message));
    }
  }

  Timer? _timer;
  void getMessageInChat(){
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      getMessages();
    });
  }
  void stopGetMessageInChat(){
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    emit(StopGetMessage());
  }
}
