import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class BotChatBubble extends StatelessWidget {
  final String reply;
  const BotChatBubble(this.reply, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0), child: GptMarkdown(reply));
  }
}
