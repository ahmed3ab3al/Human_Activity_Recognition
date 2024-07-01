import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/api/api_helper.dart';
import 'package:graduation_project/core/api/end_points.dart';
import 'package:graduation_project/features/chat/data/models/ChatModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/errors/exception.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.apiHelper) : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final ApiHelper apiHelper;

  ChatModel? chatModel;
  void getChat()async{
      emit(GetChatLoading());
      try{
        var response = await apiHelper.get(
            EndPoints.chat
        );
        chatModel = ChatModel.fromJson(response);
        emit(GetChatSuccess());
      } on ServerException catch (e) {
        emit(GetChatError(error: e.errorModel.message));
      }
  }

  void refreshPatientsMedicine(RefreshController refreshController) async{
    getChat();
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
