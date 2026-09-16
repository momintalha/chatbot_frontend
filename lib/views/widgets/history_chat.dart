import 'package:flutter/material.dart';

class HistoryChat extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final void Function() onLongTap;
  const HistoryChat({
    super.key,
    required this.title,
    required this.onTap,
    required this.onLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongTap,
      child: Row(
        spacing: 10,
        children: [
          Icon(Icons.message),
          Expanded(
            child: Text(title, overflow: TextOverflow.ellipsis, maxLines: 1),
          ),
        ],
      ),
    );
  }
}
