import 'package:chatbot_frontend/models/message_model.dart';
import 'package:chatbot_frontend/repositories/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import 'package:bloc/bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  int? chatid;
  ChatBloc() : super(InitialState()) {
    final ChatRepository repository = ChatRepository();

    on<NewChat>((event, emit) {
      //repository.newChat(title, createdAt, updatedAt);
    });

    on<SendMessage>((event, emit) async {
      debugPrint('in block');

      MessageModel message = MessageModel(
        role: 'user',
        message: event.query,
        isLoading: true,
      );

      emit(ResponseState(chat: [...state.chat, message]));

      chatid ??= await repository.newChat(
        event.query,
        DateTime.now().toString(),
        null,
      );

      debugPrint('after newchat');

      emit(LoadingState());

      final response = await repository.sendMessage(event.query, chatid);
      message = MessageModel(
        role: 'chatbot',
        message: response,
        isLoading: false,
      );

      emit(ResponseState(chat: [...state.chat, message]));
    });

    on<LoadChat>((event, emit) {});
    on<DeleteChat>((event, emit) {});
  }
}
