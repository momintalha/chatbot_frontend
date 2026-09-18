import 'package:chatbot_frontend/models/message_model.dart';

abstract class ChatState {
  final List<MessageModel> chat;
  ChatState({this.chat = const []});
}

class InitialState extends ChatState {}

class ResponseState extends ChatState {
  ResponseState({required super.chat});
}

class ResponseError extends ChatState {
  final String error;
  ResponseError(this.error);
}

class OpenHistoryChat extends ChatState {
  final List<Map<String, dynamic>> history;
  OpenHistoryChat(this.history);
}

class LoadHistoryChat extends ChatState {
  final List<Map<String, dynamic>> history;
  LoadHistoryChat(this.history);
}

class DeleteChatState extends ChatState {
  final bool isDeleted;
  DeleteChatState(this.isDeleted);
}
