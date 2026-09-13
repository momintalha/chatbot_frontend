import 'package:flutter/material.dart';

class UserChatBubble extends StatelessWidget {
  final String query;
  final bool isUser;
  const UserChatBubble(this.query, this.isUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 8, top: 8, bottom: 8),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(query, style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
        CircleAvatar(child: Icon(Icons.person, color: Colors.blue, size: 20)),
      ],
    );
  }
}
