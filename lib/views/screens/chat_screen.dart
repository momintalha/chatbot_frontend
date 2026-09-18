import 'package:chatbot_frontend/viewmodels/bloc/chat_bloc.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_event.dart';
import 'package:chatbot_frontend/views/screens/chat_history.dart';
import 'package:chatbot_frontend/views/widgets/bot_chat_bubble.dart';
import 'package:chatbot_frontend/views/widgets/chat_input.dart';
import 'package:chatbot_frontend/views/widgets/loading_animation.dart';
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
      drawer: ChatHistory(),
      onDrawerChanged: (isOpened) {
        context.read<ChatBloc>().add(LoadChat());
      },
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
                      if (state is ResponseState) {
                        if (state.chat[index].isLoading == true) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              UserChatBubble(state.chat[index].message!),
                              LoadingAnimation(),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              (state.chat[index].role == 'user')
                                  ? UserChatBubble(state.chat[index].message!)
                                  : BotChatBubble(state.chat[index].message!),
                            ],
                          );
                        }
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
