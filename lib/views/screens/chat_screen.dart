import 'package:chatbot_frontend/viewmodels/bloc/chat_bloc.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_event.dart';
import 'package:chatbot_frontend/views/screens/chat_history_screen.dart';
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
      drawer: ChatHistoryScreen(),
      onDrawerChanged: (isOpened) {
        context.read<ChatBloc>().add(LoadChat());
      },
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          final historyChat = (state is LoadedHistory) ? state.history : [];
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    itemCount: (historyChat.isNotEmpty)
                        ? historyChat.length
                        : state.chat.length,
                    itemBuilder: (context, index) {
                      if (historyChat.isNotEmpty) {
                        return (historyChat[index]['role'] == 'user')
                            ? UserChatBubble(historyChat[index]['content'])
                            : BotChatBubble(historyChat[index]['content']);
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
