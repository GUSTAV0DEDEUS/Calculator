import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.content, required this.onPressed});
  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(244, 67, 54, .2)),
      ),
      child: Text(content, style: const TextStyle(fontSize: 30)),
    );
  }
}
