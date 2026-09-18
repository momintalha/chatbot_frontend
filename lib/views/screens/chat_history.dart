import 'package:chatbot_frontend/viewmodels/bloc/chat_bloc.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_event.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_state.dart';
import 'package:chatbot_frontend/views/screens/history_screen.dart';
import 'package:chatbot_frontend/views/widgets/history_chat.dart';
import 'package:chatbot_frontend/views/widgets/chat_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        final chats = (state is LoadHistoryChat) ? state.history : [];
        return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ChatBot'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              Text('Recents'),
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return HistoryChat(
                      title: chats[index]['title'],
                      onLongTap: () {
                        context.read<ChatBloc>().add(
                          DeleteChat(chats[index]['id']),
                        );
                        if (state is DeleteChatState) {
                          if (state.isDeleted == true) {
                            ScaffoldMessenger(
                              child: SnackBar(content: Text('Delted')),
                            );
                          }
                        }
                      },
                      onTap: () {
                        context.read<ChatBloc>().add(
                          OpenChat(chats[index]['id']),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              ChatIcon(
                callback: () {
                  context.read<ChatBloc>().add(NewChat());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
