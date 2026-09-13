import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController? _textEditingController;
  const ChatInput({super.key, required this._textEditingController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.7,
        constraints: BoxConstraints(maxHeight: 60),
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
          minLines: 1,
          maxLines: null, // null = grows as needed, no upper line limit itself
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          cursorColor: Colors.blue,
          cursorHeight: 20,
          decoration: InputDecoration(
            hintText: 'Ask ChatBot',
            hintStyle: Theme.of(context).textTheme.labelSmall,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
