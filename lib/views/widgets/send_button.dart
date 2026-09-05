import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final void Function() onTap;

  const SendButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset('assets/icons/send_icon.png'),
      style: Theme.of(context).iconButtonTheme.style,
    );
  }
}
