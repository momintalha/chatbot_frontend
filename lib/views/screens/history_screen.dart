import 'package:chatbot_frontend/viewmodels/bloc/chat_bloc.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_state.dart';
import 'package:chatbot_frontend/views/widgets/bot_chat_bubble.dart';
import 'package:chatbot_frontend/views/widgets/user_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        final history = (state is OpenHistoryChat) ? state.history : [];
        debugPrint(history.toString());
        return Scaffold(
          appBar: AppBar(title: Text('History')),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    (history[index]['role'] == 'user')
                        ? UserChatBubble(history[index]['content'])
                        : BotChatBubble(history[index]['content']),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
