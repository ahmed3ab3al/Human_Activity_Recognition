part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class GetChatLoading extends ChatState {}

class GetChatSuccess extends ChatState {}

class GetChatError extends ChatState {
  final error;
  GetChatError({required this.error});
}

class GetMessageLoading extends ChatState {}

class GetMessageSuccess extends ChatState {}

class GetMessageError extends ChatState {
  final error;
  GetMessageError({required this.error});
}

class SendMessageLoading extends ChatState {}

class SendMessageSuccess extends ChatState {}

class SendMessageError extends ChatState {
  final error;
  SendMessageError({required this.error});
}

class GetMessageSocketSuccess extends ChatState {}
