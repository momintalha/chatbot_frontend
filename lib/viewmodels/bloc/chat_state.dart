import 'package:chatbot_frontend/models/message_model.dart';

abstract class ChatState {
  final List<MessageModel> chat;
  ChatState({this.chat = const []});
}

class InitialState extends ChatState {}

class LoadingState extends ChatState {}

class ResponseState extends ChatState {
  ResponseState({required super.chat});
}

class ResponseError extends ChatState {
  final String error;
  ResponseError(this.error);
}
