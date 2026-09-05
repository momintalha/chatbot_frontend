import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController? _textEditingController;
  const ChatInput({super.key, required this._textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      cursorColor: Colors.blue,
      cursorHeight: 14,
      decoration: InputDecoration(
        hintText: 'Ask ChatBot',
        hintStyle: Theme.of(context).textTheme.labelSmall,
        border: ShapedInputBorder(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
            side: BorderSide(color: Colors.black12, width: 0.5),
          ),
        ),
      ),
    );
  }
}
