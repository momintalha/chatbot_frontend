import 'package:chatbot_frontend/services/chat_service.dart';

import 'chat_event.dart';
import 'chat_state.dart';
import 'package:bloc/bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState?> {
  ChatBloc() : super(null) {
    on<SendMessage>((event, emit) {
      emit(LoadingState());
      ChatService.getReply(event.query);
    });
    on<RecieveMessage>((event, emit) {
      emit(ResponseState());
    });
  }
}
