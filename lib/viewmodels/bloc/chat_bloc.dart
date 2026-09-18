import 'package:chatbot_frontend/models/message_model.dart';
import 'package:chatbot_frontend/repositories/chat_repository.dart';
import 'package:flutter/foundation.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import 'package:bloc/bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  int? chatid;
  ChatBloc() : super(InitialState()) {
    final ChatRepository repository = ChatRepository();

    // on<NewChat>((event, emit) async{
    //   await repository.newChat(
    //     event.query,
    //     DateTime.now().toString(),
    //     null,
    //   );
    // });

    on<SendMessage>((event, emit) async {
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

      final response = await repository.sendMessage(event.query, chatid);
      message = MessageModel(
        role: 'chatbot',
        message: response,
        isLoading: false,
      );

      final updateChat = [...state.chat];
      updateChat[updateChat.length - 1] = updateChat.last.copyWith(
        isLoading: false,
      );

      emit(ResponseState(chat: [...updateChat, message]));
    });

    on<LoadChat>((event, emit) async {
      final chats = await repository.loadChat();
      emit(LoadHistoryChat(chats));
    });

    on<OpenChat>((event, emit) async {
      debugPrint(event.id.toString());
      final chat = await repository.openChat(event.id);
      debugPrint(event.id.toString());
      debugPrint('in open chat');
      emit(OpenHistoryChat(chat));
    });

    on<DeleteChat>((event, emit) async {
      final int del = await repository.deleteChat(chatid);
      emit(DeleteChatState(del > 0));
    });
  }
}
