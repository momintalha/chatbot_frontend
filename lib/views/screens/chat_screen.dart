import 'package:chatbot_frontend/viewmodels/bloc/chat_bloc.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_event.dart';
import 'package:chatbot_frontend/views/widgets/bot_chat_bubble.dart';
import 'package:chatbot_frontend/views/widgets/chat_input.dart';
import 'package:chatbot_frontend/views/widgets/send_button.dart';
import 'package:chatbot_frontend/views/widgets/user_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/bloc/chat_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('ChatBot')),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    itemCount: state.chat.length,
                    itemBuilder: (context, index) {
                      final messages = state.chat[index];

                      if (state is LoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black12,
                            color: Colors.blue,
                          ),
                        );
                      }

                      if (state is ResponseState) {
                        return (messages.role == 'user')
                            ? UserChatBubble(state.chat[index].message!, true)
                            : BotChatBubble(state.chat[index].message!, true);
                      }

                      return Container();
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white54),
                  child: Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        child: ChatInput(
                          textEditingController: textEditingController,
                        ),
                      ),
                      SendButton(
                        onTap: () {
                          context.read<ChatBloc>().add(
                            SendMessage(textEditingController.text),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
