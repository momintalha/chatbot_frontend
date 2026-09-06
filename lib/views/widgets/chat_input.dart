import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController? _textEditingController;
  const ChatInput({super.key, required this._textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1),
        ],
      ),
      child: TextField(
        controller: _textEditingController,
        style: Theme.of(context).textTheme.bodySmall,
        expands: true,
        cursorColor: Colors.blue,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: 'Ask ChatBot',
          hintStyle: Theme.of(context).textTheme.labelSmall,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
