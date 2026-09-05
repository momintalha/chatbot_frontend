import 'package:chatbot_frontend/viewmodels/bloc/chat_bloc.dart';
import 'package:chatbot_frontend/viewmodels/bloc/chat_event.dart';
import 'package:chatbot_frontend/views/widgets/chat_input.dart';
import 'package:chatbot_frontend/views/widgets/send_button.dart';
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
      body: BlocBuilder<ChatBloc, ChatState?>(
        builder: (context, state) {
          return Column(
            children: [
              //  ListView.builder(itemBuilder: (context, index){

              //  }),
              Row(
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
            ],
          );
        },
      ),
    );
  }
}
