import 'package:flutter/material.dart';

class ChatIcon extends StatelessWidget {
  final void Function() callback;
  const ChatIcon({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          spacing: 5,
          children: [
            Icon(Icons.edit_outlined),
            Text('chat', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
