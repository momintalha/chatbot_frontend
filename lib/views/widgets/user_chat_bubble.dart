import 'package:flutter/material.dart';

class UserChatBubble extends StatelessWidget {
  final String query;
  const UserChatBubble(this.query, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(query, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
